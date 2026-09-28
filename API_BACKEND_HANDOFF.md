# Neev Money — API to Screen Handoff (Backend Developer)

Source: `JK Capital Questionnaire.xlsx` (sheet `API List`, gid 49660685) + current Flutter app audit.
Date: 2026-09-28. Package: `new_app`. Base URL (app config): `https://api.neevmoney.com/v1` (`lib/data/local/api_config.dart`, env `API_BASE_URL`, 30s timeout).

## 0. Current app status (important)

- **No API is integrated yet.** Grep over `lib/` finds zero calls to any `/auth`, `/funds`, `/portfolio`, `/sip`, `/kyc`, `/goals`, `/transactions`, `/notifications`, `/watchlist`, `/bank-accounts`, `/mandates`, `/nominees`, `/reports`, `/users`, `/onboarding`, `/legal` endpoint.
- Network scaffold exists but is dead code: `DioClient` (`lib/data/remote/api/dio_client.dart`, Bearer token from `TokenStorage`), `ApiHelper.get/post` (`lib/data/remote/api/api_helper.dart`, zero call sites), `FundConnectHelper` / `AuthConnectHelper` (return `MockData` after `Future.delayed`).
- All screens render **mock/local data**: `MockData` (`lib/data/local/mock_data.dart`), `onboarding_data.dart`, `goals_data.dart`, `TransactionMock`, `NotificationMock`, `WatchlistStorage` (SharedPrefs), `UserPrefs` (name/email/phone/biometric).
- Auth is local: OTP screen accepts any 6 digits (`OnboardingBloc._onVerifyOtp`), session = `UserPrefs.phone` non-empty (`SplashPage._redirectIfLoggedIn`). `TokenStorage` is written by unused helper only.
- What backend must do: implement everything marked **Offered by Cybrilla = No** (≈35 endpoints), plus confirm contract for Cybrilla-pass-through endpoints.

## 1. Global conventions (proposed — please confirm)

- Auth: `Authorization: Bearer <JWT>`. JWT issued by `POST /auth/otp/verify` (and `POST /auth/google`). All `/users`, `/portfolio`, `/goals`, `/sip`, `/transactions`, etc. require it. `401` → app forces logout to `/login`.
- Content: JSON, `Content-Type: application/json`. Errors: `{ "code": "STRING", "message": "Human readable" }` mapped to `AppFailure` (`lib/domain/entity/app_failure.dart`: connection/unauthorized/notFound/serverError/unknown).
- Pagination (list APIs): query `?page=&limit=&q=&category=` unless specified. Please confirm.
- IDs: funds by `id` today (`'1'..'4'` in mocks), but sheet notes **pass ISIN for scheme details** — please confirm canonical fund key (`id` vs `isin`).
- Compliance notes from sheet (must enforce server-side):
  - Accounts can be deactivated, **not deleted** → `DELETE /users/me` should deactivate; app treats it as delete.
  - Names **cannot be modified once set**; email can be.
  - Consent (terms/privacy/KYC/SIP) **to be handled by MFD**.
  - RM dashboard mapping is frontend-handled; backend only maps transaction→RM.

## 2. Screen → API map (where to wire each endpoint)

| App screen (file) | APIs to call | Current mock to replace |
|---|---|---|
| Splash / Get Started (`onboarding/pages/splash_page.dart`) | `GET /users/me` (session check, optional), `POST /onboarding/complete` status | `UserPrefs.getPhone()` |
| Signup — name+phone (`onboarding/pages/signup_page.dart`) | `POST /auth/otp/send` | `OnboardingBloc.submitSignup` (delay only) |
| OTP (`onboarding/pages/otp_page.dart`) | `POST /auth/otp/verify` → JWT + user; `POST /auth/otp/resend` | accepts any 6 digits locally |
| Google button (`signup_page.dart:_GoogleContinueButton`) | `POST /auth/google` (toast "coming soon" today) | toast only |
| Goal select/detail/review (`goal_select_page.dart`, `goal_detail_page.dart`, `goals_review_page.dart`) | `GET /goals/templates`, `POST /onboarding/goals`, `GET /goals`, `POST /goals`, `PATCH /goals/:id`, `DELETE /goals/:id` | `onboarding_data.goals`, `goals_data.userGoals` |
| Risk quiz + result (`quiz_page.dart`, `risk_result_page.dart`) | `GET /risk-assessment/questions`, `POST /onboarding/risk-profile`, `GET /onboarding/risk-profile` | `onboarding_data.quiz/bands` |
| Fund recommendations (`fund_recs_page.dart`) | `GET /onboarding/fund-recommendations?goal=&risk=` | `samplePlanFunds(goalId)` |
| RM intro/select/confirmed (`rm_*_page.dart`, `account_screen` RM row) | `POST /onboarding/relationship-manager/match`, `GET /relationship-managers`, `POST /onboarding/relationship-manager`, `GET /users/me/rm` | `onboarding_data.rms` filtered by band |
| Onboarding success (`success_page.dart`) | `POST /onboarding/complete` | local nav only |
| Home dashboard (`home/home_screen.dart`) | `GET /portfolio`, `GET /goals`, `GET /sip/upcoming` | `HomeBloc` ← `MockData.portfolio/funds` |
| Explore + search (`explore/explore_screen.dart`, `fund_detail_screen.dart`) | `GET /funds?category=`, `GET /funds/search?q=`, `GET /funds/:id`, `GET /funds/:id/nav-history` | `ExploreBloc/FundDetailBloc` ← `MockData.funds` |
| Portfolio (`portfolio/portfolio_screen.dart`) | `GET /portfolio` | `PortfolioBloc` ← `MockData.portfolio` |
| Fund detail chart/stats (`fund/fund_detail_screen.dart`) | `GET /funds/:id`, `GET /funds/:id/nav-history` | `FundModel` mock (NAV, expense, holdings) |
| KYC (`sip/kyc_details_screen.dart`) | `POST /kyc`, `GET /kyc/status` | pre-filled demo form, local validate |
| Start SIP → Confirm → Success (`sip/start_sip_screen.dart`, `confirm_pay_screen.dart`, `success_screen.dart`) | `POST /sip`, `GET /payment-methods`, `GET /mandates`, `POST /legal/consent` (MFD) | `SipBloc.createSip` fabricates folio/timestamp |
| Lumpsum invest (`invest_more_page.dart`, onboarding `start_sip_page.dart`) | `POST /investments/lumpsum` | bloc-local state only |
| Withdraw (`portfolio` redeem CTA — confirm with backend where wired) | `POST /withdrawals`, `GET /withdrawals/:id`, `GET /withdrawals` | none (new) |
| Transactions (`account/transactions_screen.dart`) | `GET /transactions` | `TransactionMock.items` |
| Notifications bell + inbox (`widgets/notifications_bell.dart`, `home_screen`, `account/notifications_screen.dart`) | `GET /notifications`, `GET /notifications/unread-count`, `PATCH /notifications/:id/read`, `POST /notifications/mark-all-read` | `NotificationMock` |
| Watchlist (`explore/watchlist_screen.dart`, `watchlist_toggle_button.dart`) | `GET /watchlist`, `POST /watchlist/:fundId`, `DELETE /watchlist/:fundId` | `WatchlistStorage` (SharedPrefs) |
| Account hub (`account/account_screen.dart`) | `GET /users/me`, `GET /users/me/rm`, `POST /auth/logout`, `DELETE /users/me` | `UserPrefs` |
| Edit profile + email verify (`account/edit_profile_screen.dart`) | `GET /users/me`, `PATCH /users/me`, `POST /users/me/email/verify` | `UserPrefs` + bottom sheet |
| Bank / mandate / nominee (SIP + account; confirm placement) | `GET /bank-accounts`, `POST /bank-accounts`, `GET /mandates`, `GET /nominees`, `POST /nominees` | none (new) |
| Statements (`account_screen` / reports entry) | `GET /reports/capital-gains`, `GET /reports/statement` | none (new, file download) |
| Privacy / Terms (`account/privacy_policy_screen.dart`) | `GET /legal/privacy-policy`, `GET /legal/terms` | static text |

## 3. Endpoint details (from sheet + app models)

### 3.1 Auth (`SignupPage`, `OtpPage`, splash, account logout)

| # | Method Path | Purpose | Request | Response | Cybrilla | Backend action / notes |
|---|---|---|---|---|---|---|
| 2 | `POST /auth/otp/send` | Send OTP for signup/login | `{ phone: "9876543210" }` (10-digit, `+91` added in UI) | `{ requestId, expiresInSec, resendAfterSec }` | No | Build. Rate-limit + resend cooldown. |
| 3 | `POST /auth/otp/verify` | Verify OTP, issue session | `{ phone, otp: "6-digit", requestId?, name? }` | `{ token: JWT, user: UserModel }` | No | Build. `UserModel{id,name,email,phone,isKycVerified}` (`lib/domain/models/user_model.dart`). Returning-user flag drives `enterApp` vs `goalSelect` (`OnboardingBloc._onVerifyOtp`). |
| 4 | `POST /auth/otp/resend` | Resend same-phone OTP | `{ phone, requestId? }` | `{ requestId, expiresInSec }` | No | Build. |
| 5 | `POST /auth/google` | Google OAuth sign-in | `{ idToken }` | `{ token, user }` same as verify | No | Build. App shows "coming soon" toast today. |
| 6 | `POST /auth/logout` | End session | `{}` (Bearer) | `{ ok: true }` | No | Build. App also clears `UserPrefs` + routes to `/login`. Invalidate server session/token. |

### 3.2 User / profile (`AccountScreen`, `EditProfileScreen`)

| # | Method Path | Purpose | Data | Cybrilla | Notes |
|---|---|---|---|---|---|
| 8 | `GET /users/me` | Current profile | → `UserModel` | Yes | Confirm passthrough contract. Used for hub header, splash session check. |
| 9 | `PATCH /users/me` | Update name/email/phone | `{ name?, email?, phone? }` → `UserModel` | Yes | Enforce: **name immutable once set**, email mutable. App currently writes `UserPrefs` only. |
| 10 | `POST /users/me/email/verify` | Email OTP verify | `{ email, otp }` → `{ verified: true }` | No | Build. Triggered from edit-profile bottom sheet. |
| 7 | `DELETE /users/me` | Delete/deactivate account | Bearer → `{ ok: true }` | No | **Deactivate, don't hard-delete** (compliance note). App clears profile + to `/login`. |
| 11 | `GET /users/me/rm` | Assigned RM | → `{ id, name, … }` | No | Build. Transaction→RM mapping server-side; dashboard rendering is frontend. |

### 3.3 Funds / Explore (`ExploreScreen`, `FundDetailScreen`)

App `FundModel` (`lib/domain/models/fund_model.dart`): `{ id, name, category, riskLevel, returns3Y, minSip, nav, expenseRatio, fundSize, shortCode, planType, rating, holdings[{name,percentage}] }`.

| # | Method Path | Purpose | Cybrilla | Notes |
|---|---|---|---|---|
| 12 | `GET /funds?category=` | Fund list + category filter | No | Build. **Send ISIN** per sheet note for scheme details. Confirm `id` vs `isin` key. |
| 13 | `GET /funds/:id` | Single fund detail | Yes | Sheet: scheme details only, **no performance data**. Confirm fields. |
| 14 | `GET /funds/:id/nav-history?range=` | NAV chart | No | Build. Sheet: part of performance data, not offered by Cybrilla. Return `[{ date, nav }]` for chart. |
| 15 | `GET /funds/search?q=` | Search | Yes | Confirm contract. |

### 3.4 Portfolio / Home (`HomeScreen`, `PortfolioScreen`)

App `PortfolioSummary` (`lib/domain/models/portfolio_model.dart`): `{ currentValue, investedAmount, totalReturns, totalReturnsPercent, oneDayChange, oneDayChangePercent, allocation[{name,percentage}], holdings[{fundId,fundName,currentValue,dailyChange,dailyChangePercent,profitLoss,profitLossPercent}] }`.

| # | Method Path | Screens | Cybrilla |
|---|---|---|---|
| 16 | `GET /portfolio` | Home stats/cards, Portfolio summary/allocation/holdings | Yes |
| 35 | `GET /sip/upcoming` | Home "next SIP debit" reminder | Yes |

### 3.5 Goals + onboarding (`GoalSelect/Detail/Review`, `GoalsScreen`, onboarding success)

Today: `GoalOption` catalog + in-memory `GoalItem{goalId,label,amountLabel,tenureLabel,amountValue}` (`goals_data.dart`). All CRUD local.

| # | Method Path | Purpose | Cybrilla |
|---|---|---|---|
| 21 | `GET /goals/templates` | Goal catalog for onboarding grid | No — FE today |
| 22 | `POST /onboarding/goals` | Batch-save onboarding selections `{ goals: [{goalId}] }` | No — FE today |
| 17 | `GET /goals` | List goals + progress | No — FE today |
| 18 | `POST /goals` | Create goal `{ goalId/label, targetAmount?, tenure? }` | No — FE today |
| 19 | `PATCH /goals/:id` | Update target/tenure | No — FE today |
| 20 | `DELETE /goals/:id` | Remove goal | No — FE today |
| 30 | `POST /onboarding/complete` | Mark onboarding finished | Yes |

### 3.6 Risk + recommendations + RM (quiz → fundRecs → RM flow)

Today: `quiz/bands/rms/samplePlanFunds()` in `onboarding_data.dart`; band filter for RMs.

| # | Method Path | Purpose | Cybrilla |
|---|---|---|---|
| 23 | `GET /risk-assessment/questions` | Quiz questions | No — FE today |
| 24 | `POST /onboarding/risk-profile` | Submit answers → risk band + allocation | No — FE today |
| 25 | `GET /onboarding/risk-profile` | Saved band/allocation | No — FE today |
| 26 | `GET /onboarding/fund-recommendations?goal=&risk=` | Allocation plan | No — FE today |
| 27 | `POST /onboarding/relationship-manager/match` | Trigger RM match | No — FE today |
| 28 | `GET /relationship-managers` | RMs for band | No — FE today |
| 29 | `POST /onboarding/relationship-manager` | Assign RM `{ rmId }` | No — FE today |

### 3.7 KYC / SIP / invest (`KycDetailsScreen`, `StartSipScreen`, `ConfirmPayScreen`, `SuccessScreen`, `InvestMorePage`)

App `SipModel{fundId,fundName,amount,debitDay,paymentMethod,projectedValue}`, `SipConfirmation{folioNumber,nextDebitDate,amount,fundName}` (`sip_model.dart`).

| # | Method Path | Purpose | Cybrilla |
|---|---|---|---|
| 31 | `POST /kyc` | Submit `{ pan, name, dob, email, gender }` | Yes |
| 32 | `GET /kyc/status` | `{ status, remarks? }` gate SIP | Yes |
| 33 | `POST /sip` | Create mandate + first payment `{ fundId/isin, amount, debitDay, paymentMethod, mandateId? }` → `SipConfirmation` | Yes |
| 34 | `GET /payment-methods` | Saved methods/mandates for ConfirmPay | Yes |
| 53 | `GET /mandates` | Active mandates (pick in SIP) | Yes |
| 36 | `POST /investments/lumpsum` | One-time invest `{ fundId, amount }` | Yes |
| 50 | `POST /legal/consent` | Store T&C/privacy/KYC/SIP consent | No — **MFD handles** |

### 3.8 Withdrawals / transactions / reports

| # | Method Path | Screens | Cybrilla |
|---|---|---|---|
| 37 | `POST /withdrawals` | Redeem `{ fundId, amount }` → `{ id, status }` | Yes |
| 38 | `GET /withdrawals/:id` | Withdrawal status | Yes |
| 39 | `GET /withdrawals` | Withdrawal history | Yes |
| 40 | `GET /transactions` | Txn history (SIP/lumpsum/redeem) | Yes — replaces `TransactionMock` |
| 56 | `GET /reports/capital-gains` | Download statement (PDF/CSV — confirm) | Yes |
| 57 | `GET /reports/statement` | Download statement | Yes |

### 3.9 Notifications (bell + inbox)

| # | Method Path | Purpose | Cybrilla |
|---|---|---|---|
| 41 | `GET /notifications` | Inbox list | No — `NotificationMock` today |
| 42 | `GET /notifications/unread-count` | Home badge | No |
| 43 | `PATCH /notifications/:id/read` | Mark one read | No |
| 44 | `POST /notifications/mark-all-read` | Mark all read | No |

### 3.10 Watchlist (Explore/Account)

| # | Method Path | Purpose | Cybrilla |
|---|---|---|---|
| 45 | `GET /watchlist` | Saved fund IDs | No — SharedPrefs today |
| 46 | `POST /watchlist/:fundId` | Add | No |
| 47 | `DELETE /watchlist/:fundId` | Remove | No |

### 3.11 Legal (Privacy screen, signup consent)

| # | Method Path | Purpose | Cybrilla |
|---|---|---|---|
| 48 | `GET /legal/privacy-policy` | Policy HTML/text | No — static text today |
| 49 | `GET /legal/terms` | T&C HTML/text | No |

### 3.12 Bank / nominee (SIP + account)

| # | Method Path | Purpose | Cybrilla |
|---|---|---|---|
| 51 | `GET /bank-accounts` | Linked banks | Yes |
| 52 | `POST /bank-accounts` | Add bank `{ accountNo, ifsc, … }` (confirm fields) | Yes |
| 54 | `GET /nominees` | Nominees | Yes |
| 55 | `POST /nominees` | Add/update nominee | Yes |

## 4. Suggested integration order for backend

1. Auth (`/auth/otp/*`, `/auth/google`, `/auth/logout`) + `GET /users/me` — unblocks real login/logout.
2. Funds (`/funds`, `/funds/search`, `/funds/:id`, `/funds/:id/nav-history`) + `GET /portfolio` + `GET /sip/upcoming` — makes Home/Explore/Portfolio/FundDetail real.
3. KYC + SIP + payments (`/kyc*`, `/sip`, `/payment-methods`, `/mandates`, `/investments/lumpsum`, `/withdrawals*`, `/transactions`, `/bank-accounts`, `/nominees`, `/reports/*`) — completes money flow.
4. Onboarding backend (`/goals*`, `/onboarding/*`, `/risk-assessment/*`, `/relationship-managers`) — replaces in-app static flow; needs product sign-off on quiz/bands/RM logic.
5. Engagement (`/notifications*`, `/watchlist`, `/legal/*`, email-verify, consents) — last.

## 5. Open confirmations needed from backend

1. Canonical fund key: `id` vs `isin` (sheet says pass ISIN).
2. `GET /funds/:id` exact fields (no performance data per Cybrilla) vs `nav-history` range params.
3. JWT shape/expiry/refresh; `401` handling; Google `idToken` verification.
4. `DELETE /users/me` semantics (deactivate vs delete) + response.
5. File formats for `/reports/*` (PDF/CSV) and auth.
6. Pagination/filter params for `/funds`, `/transactions`, `/notifications`, `/withdrawals`.
7. RM object shape + transaction→RM mapping rule.
8. Consent payloads owned by MFD (`/legal/consent`).
