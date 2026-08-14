// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StartFlow value)?  startFlow,TResult Function( StartSignIn value)?  startSignIn,TResult Function( NameChanged value)?  nameChanged,TResult Function( PhoneChanged value)?  phoneChanged,TResult Function( OtpChanged value)?  otpChanged,TResult Function( SubmitSignup value)?  submitSignup,TResult Function( ResendOtp value)?  resendOtp,TResult Function( VerifyOtp value)?  verifyOtp,TResult Function( GoalSelected value)?  goalSelected,TResult Function( ContinueFromGoalSelect value)?  continueFromGoalSelect,TResult Function( SkipGoalSelect value)?  skipGoalSelect,TResult Function( AmountSelected value)?  amountSelected,TResult Function( CustomAmountChanged value)?  customAmountChanged,TResult Function( TimeframeSelected value)?  timeframeSelected,TResult Function( ContinueFromGoalDetail value)?  continueFromGoalDetail,TResult Function( AddAnotherGoal value)?  addAnotherGoal,TResult Function( ContinueFromGoalsReview value)?  continueFromGoalsReview,TResult Function( QuizAnswered value)?  quizAnswered,TResult Function( QuizAdvanceAfterAnswer value)?  quizAdvanceAfterAnswer,TResult Function( GoToRmIntro value)?  goToRmIntro,TResult Function( RmIntroAutoAdvance value)?  rmIntroAutoAdvance,TResult Function( RmSelected value)?  rmSelected,TResult Function( ContinueFromRmSelect value)?  continueFromRmSelect,TResult Function( ContinueFromRmConfirmed value)?  continueFromRmConfirmed,TResult Function( ConfirmInvest value)?  confirmInvest,TResult Function( GoToDashboard value)?  goToDashboard,TResult Function( SwitchTab value)?  switchTab,TResult Function( InvestAmountSelected value)?  investAmountSelected,TResult Function( InvestCustomAmountChanged value)?  investCustomAmountChanged,TResult Function( InvestFundSelected value)?  investFundSelected,TResult Function( ConfirmInvestMore value)?  confirmInvestMore,TResult Function( InvestAgain value)?  investAgain,TResult Function( SipAmountSelected value)?  sipAmountSelected,TResult Function( SipCustomAmountChanged value)?  sipCustomAmountChanged,TResult Function( SipFundSelected value)?  sipFundSelected,TResult Function( SipDateSelected value)?  sipDateSelected,TResult Function( ConfirmSip value)?  confirmSip,TResult Function( EditSip value)?  editSip,TResult Function( Restart value)?  restart,TResult Function( GoBack value)?  goBack,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StartFlow() when startFlow != null:
return startFlow(_that);case StartSignIn() when startSignIn != null:
return startSignIn(_that);case NameChanged() when nameChanged != null:
return nameChanged(_that);case PhoneChanged() when phoneChanged != null:
return phoneChanged(_that);case OtpChanged() when otpChanged != null:
return otpChanged(_that);case SubmitSignup() when submitSignup != null:
return submitSignup(_that);case ResendOtp() when resendOtp != null:
return resendOtp(_that);case VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case GoalSelected() when goalSelected != null:
return goalSelected(_that);case ContinueFromGoalSelect() when continueFromGoalSelect != null:
return continueFromGoalSelect(_that);case SkipGoalSelect() when skipGoalSelect != null:
return skipGoalSelect(_that);case AmountSelected() when amountSelected != null:
return amountSelected(_that);case CustomAmountChanged() when customAmountChanged != null:
return customAmountChanged(_that);case TimeframeSelected() when timeframeSelected != null:
return timeframeSelected(_that);case ContinueFromGoalDetail() when continueFromGoalDetail != null:
return continueFromGoalDetail(_that);case AddAnotherGoal() when addAnotherGoal != null:
return addAnotherGoal(_that);case ContinueFromGoalsReview() when continueFromGoalsReview != null:
return continueFromGoalsReview(_that);case QuizAnswered() when quizAnswered != null:
return quizAnswered(_that);case QuizAdvanceAfterAnswer() when quizAdvanceAfterAnswer != null:
return quizAdvanceAfterAnswer(_that);case GoToRmIntro() when goToRmIntro != null:
return goToRmIntro(_that);case RmIntroAutoAdvance() when rmIntroAutoAdvance != null:
return rmIntroAutoAdvance(_that);case RmSelected() when rmSelected != null:
return rmSelected(_that);case ContinueFromRmSelect() when continueFromRmSelect != null:
return continueFromRmSelect(_that);case ContinueFromRmConfirmed() when continueFromRmConfirmed != null:
return continueFromRmConfirmed(_that);case ConfirmInvest() when confirmInvest != null:
return confirmInvest(_that);case GoToDashboard() when goToDashboard != null:
return goToDashboard(_that);case SwitchTab() when switchTab != null:
return switchTab(_that);case InvestAmountSelected() when investAmountSelected != null:
return investAmountSelected(_that);case InvestCustomAmountChanged() when investCustomAmountChanged != null:
return investCustomAmountChanged(_that);case InvestFundSelected() when investFundSelected != null:
return investFundSelected(_that);case ConfirmInvestMore() when confirmInvestMore != null:
return confirmInvestMore(_that);case InvestAgain() when investAgain != null:
return investAgain(_that);case SipAmountSelected() when sipAmountSelected != null:
return sipAmountSelected(_that);case SipCustomAmountChanged() when sipCustomAmountChanged != null:
return sipCustomAmountChanged(_that);case SipFundSelected() when sipFundSelected != null:
return sipFundSelected(_that);case SipDateSelected() when sipDateSelected != null:
return sipDateSelected(_that);case ConfirmSip() when confirmSip != null:
return confirmSip(_that);case EditSip() when editSip != null:
return editSip(_that);case Restart() when restart != null:
return restart(_that);case GoBack() when goBack != null:
return goBack(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StartFlow value)  startFlow,required TResult Function( StartSignIn value)  startSignIn,required TResult Function( NameChanged value)  nameChanged,required TResult Function( PhoneChanged value)  phoneChanged,required TResult Function( OtpChanged value)  otpChanged,required TResult Function( SubmitSignup value)  submitSignup,required TResult Function( ResendOtp value)  resendOtp,required TResult Function( VerifyOtp value)  verifyOtp,required TResult Function( GoalSelected value)  goalSelected,required TResult Function( ContinueFromGoalSelect value)  continueFromGoalSelect,required TResult Function( SkipGoalSelect value)  skipGoalSelect,required TResult Function( AmountSelected value)  amountSelected,required TResult Function( CustomAmountChanged value)  customAmountChanged,required TResult Function( TimeframeSelected value)  timeframeSelected,required TResult Function( ContinueFromGoalDetail value)  continueFromGoalDetail,required TResult Function( AddAnotherGoal value)  addAnotherGoal,required TResult Function( ContinueFromGoalsReview value)  continueFromGoalsReview,required TResult Function( QuizAnswered value)  quizAnswered,required TResult Function( QuizAdvanceAfterAnswer value)  quizAdvanceAfterAnswer,required TResult Function( GoToRmIntro value)  goToRmIntro,required TResult Function( RmIntroAutoAdvance value)  rmIntroAutoAdvance,required TResult Function( RmSelected value)  rmSelected,required TResult Function( ContinueFromRmSelect value)  continueFromRmSelect,required TResult Function( ContinueFromRmConfirmed value)  continueFromRmConfirmed,required TResult Function( ConfirmInvest value)  confirmInvest,required TResult Function( GoToDashboard value)  goToDashboard,required TResult Function( SwitchTab value)  switchTab,required TResult Function( InvestAmountSelected value)  investAmountSelected,required TResult Function( InvestCustomAmountChanged value)  investCustomAmountChanged,required TResult Function( InvestFundSelected value)  investFundSelected,required TResult Function( ConfirmInvestMore value)  confirmInvestMore,required TResult Function( InvestAgain value)  investAgain,required TResult Function( SipAmountSelected value)  sipAmountSelected,required TResult Function( SipCustomAmountChanged value)  sipCustomAmountChanged,required TResult Function( SipFundSelected value)  sipFundSelected,required TResult Function( SipDateSelected value)  sipDateSelected,required TResult Function( ConfirmSip value)  confirmSip,required TResult Function( EditSip value)  editSip,required TResult Function( Restart value)  restart,required TResult Function( GoBack value)  goBack,}){
final _that = this;
switch (_that) {
case StartFlow():
return startFlow(_that);case StartSignIn():
return startSignIn(_that);case NameChanged():
return nameChanged(_that);case PhoneChanged():
return phoneChanged(_that);case OtpChanged():
return otpChanged(_that);case SubmitSignup():
return submitSignup(_that);case ResendOtp():
return resendOtp(_that);case VerifyOtp():
return verifyOtp(_that);case GoalSelected():
return goalSelected(_that);case ContinueFromGoalSelect():
return continueFromGoalSelect(_that);case SkipGoalSelect():
return skipGoalSelect(_that);case AmountSelected():
return amountSelected(_that);case CustomAmountChanged():
return customAmountChanged(_that);case TimeframeSelected():
return timeframeSelected(_that);case ContinueFromGoalDetail():
return continueFromGoalDetail(_that);case AddAnotherGoal():
return addAnotherGoal(_that);case ContinueFromGoalsReview():
return continueFromGoalsReview(_that);case QuizAnswered():
return quizAnswered(_that);case QuizAdvanceAfterAnswer():
return quizAdvanceAfterAnswer(_that);case GoToRmIntro():
return goToRmIntro(_that);case RmIntroAutoAdvance():
return rmIntroAutoAdvance(_that);case RmSelected():
return rmSelected(_that);case ContinueFromRmSelect():
return continueFromRmSelect(_that);case ContinueFromRmConfirmed():
return continueFromRmConfirmed(_that);case ConfirmInvest():
return confirmInvest(_that);case GoToDashboard():
return goToDashboard(_that);case SwitchTab():
return switchTab(_that);case InvestAmountSelected():
return investAmountSelected(_that);case InvestCustomAmountChanged():
return investCustomAmountChanged(_that);case InvestFundSelected():
return investFundSelected(_that);case ConfirmInvestMore():
return confirmInvestMore(_that);case InvestAgain():
return investAgain(_that);case SipAmountSelected():
return sipAmountSelected(_that);case SipCustomAmountChanged():
return sipCustomAmountChanged(_that);case SipFundSelected():
return sipFundSelected(_that);case SipDateSelected():
return sipDateSelected(_that);case ConfirmSip():
return confirmSip(_that);case EditSip():
return editSip(_that);case Restart():
return restart(_that);case GoBack():
return goBack(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StartFlow value)?  startFlow,TResult? Function( StartSignIn value)?  startSignIn,TResult? Function( NameChanged value)?  nameChanged,TResult? Function( PhoneChanged value)?  phoneChanged,TResult? Function( OtpChanged value)?  otpChanged,TResult? Function( SubmitSignup value)?  submitSignup,TResult? Function( ResendOtp value)?  resendOtp,TResult? Function( VerifyOtp value)?  verifyOtp,TResult? Function( GoalSelected value)?  goalSelected,TResult? Function( ContinueFromGoalSelect value)?  continueFromGoalSelect,TResult? Function( SkipGoalSelect value)?  skipGoalSelect,TResult? Function( AmountSelected value)?  amountSelected,TResult? Function( CustomAmountChanged value)?  customAmountChanged,TResult? Function( TimeframeSelected value)?  timeframeSelected,TResult? Function( ContinueFromGoalDetail value)?  continueFromGoalDetail,TResult? Function( AddAnotherGoal value)?  addAnotherGoal,TResult? Function( ContinueFromGoalsReview value)?  continueFromGoalsReview,TResult? Function( QuizAnswered value)?  quizAnswered,TResult? Function( QuizAdvanceAfterAnswer value)?  quizAdvanceAfterAnswer,TResult? Function( GoToRmIntro value)?  goToRmIntro,TResult? Function( RmIntroAutoAdvance value)?  rmIntroAutoAdvance,TResult? Function( RmSelected value)?  rmSelected,TResult? Function( ContinueFromRmSelect value)?  continueFromRmSelect,TResult? Function( ContinueFromRmConfirmed value)?  continueFromRmConfirmed,TResult? Function( ConfirmInvest value)?  confirmInvest,TResult? Function( GoToDashboard value)?  goToDashboard,TResult? Function( SwitchTab value)?  switchTab,TResult? Function( InvestAmountSelected value)?  investAmountSelected,TResult? Function( InvestCustomAmountChanged value)?  investCustomAmountChanged,TResult? Function( InvestFundSelected value)?  investFundSelected,TResult? Function( ConfirmInvestMore value)?  confirmInvestMore,TResult? Function( InvestAgain value)?  investAgain,TResult? Function( SipAmountSelected value)?  sipAmountSelected,TResult? Function( SipCustomAmountChanged value)?  sipCustomAmountChanged,TResult? Function( SipFundSelected value)?  sipFundSelected,TResult? Function( SipDateSelected value)?  sipDateSelected,TResult? Function( ConfirmSip value)?  confirmSip,TResult? Function( EditSip value)?  editSip,TResult? Function( Restart value)?  restart,TResult? Function( GoBack value)?  goBack,}){
final _that = this;
switch (_that) {
case StartFlow() when startFlow != null:
return startFlow(_that);case StartSignIn() when startSignIn != null:
return startSignIn(_that);case NameChanged() when nameChanged != null:
return nameChanged(_that);case PhoneChanged() when phoneChanged != null:
return phoneChanged(_that);case OtpChanged() when otpChanged != null:
return otpChanged(_that);case SubmitSignup() when submitSignup != null:
return submitSignup(_that);case ResendOtp() when resendOtp != null:
return resendOtp(_that);case VerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case GoalSelected() when goalSelected != null:
return goalSelected(_that);case ContinueFromGoalSelect() when continueFromGoalSelect != null:
return continueFromGoalSelect(_that);case SkipGoalSelect() when skipGoalSelect != null:
return skipGoalSelect(_that);case AmountSelected() when amountSelected != null:
return amountSelected(_that);case CustomAmountChanged() when customAmountChanged != null:
return customAmountChanged(_that);case TimeframeSelected() when timeframeSelected != null:
return timeframeSelected(_that);case ContinueFromGoalDetail() when continueFromGoalDetail != null:
return continueFromGoalDetail(_that);case AddAnotherGoal() when addAnotherGoal != null:
return addAnotherGoal(_that);case ContinueFromGoalsReview() when continueFromGoalsReview != null:
return continueFromGoalsReview(_that);case QuizAnswered() when quizAnswered != null:
return quizAnswered(_that);case QuizAdvanceAfterAnswer() when quizAdvanceAfterAnswer != null:
return quizAdvanceAfterAnswer(_that);case GoToRmIntro() when goToRmIntro != null:
return goToRmIntro(_that);case RmIntroAutoAdvance() when rmIntroAutoAdvance != null:
return rmIntroAutoAdvance(_that);case RmSelected() when rmSelected != null:
return rmSelected(_that);case ContinueFromRmSelect() when continueFromRmSelect != null:
return continueFromRmSelect(_that);case ContinueFromRmConfirmed() when continueFromRmConfirmed != null:
return continueFromRmConfirmed(_that);case ConfirmInvest() when confirmInvest != null:
return confirmInvest(_that);case GoToDashboard() when goToDashboard != null:
return goToDashboard(_that);case SwitchTab() when switchTab != null:
return switchTab(_that);case InvestAmountSelected() when investAmountSelected != null:
return investAmountSelected(_that);case InvestCustomAmountChanged() when investCustomAmountChanged != null:
return investCustomAmountChanged(_that);case InvestFundSelected() when investFundSelected != null:
return investFundSelected(_that);case ConfirmInvestMore() when confirmInvestMore != null:
return confirmInvestMore(_that);case InvestAgain() when investAgain != null:
return investAgain(_that);case SipAmountSelected() when sipAmountSelected != null:
return sipAmountSelected(_that);case SipCustomAmountChanged() when sipCustomAmountChanged != null:
return sipCustomAmountChanged(_that);case SipFundSelected() when sipFundSelected != null:
return sipFundSelected(_that);case SipDateSelected() when sipDateSelected != null:
return sipDateSelected(_that);case ConfirmSip() when confirmSip != null:
return confirmSip(_that);case EditSip() when editSip != null:
return editSip(_that);case Restart() when restart != null:
return restart(_that);case GoBack() when goBack != null:
return goBack(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  startFlow,TResult Function()?  startSignIn,TResult Function( String name)?  nameChanged,TResult Function( String phone)?  phoneChanged,TResult Function( String otp)?  otpChanged,TResult Function()?  submitSignup,TResult Function()?  resendOtp,TResult Function()?  verifyOtp,TResult Function( String goalId)?  goalSelected,TResult Function()?  continueFromGoalSelect,TResult Function()?  skipGoalSelect,TResult Function( String amountId)?  amountSelected,TResult Function( String amount)?  customAmountChanged,TResult Function( String timeframeId)?  timeframeSelected,TResult Function()?  continueFromGoalDetail,TResult Function()?  addAnotherGoal,TResult Function()?  continueFromGoalsReview,TResult Function( int optionIndex,  int score)?  quizAnswered,TResult Function()?  quizAdvanceAfterAnswer,TResult Function()?  goToRmIntro,TResult Function()?  rmIntroAutoAdvance,TResult Function( String rmId)?  rmSelected,TResult Function()?  continueFromRmSelect,TResult Function()?  continueFromRmConfirmed,TResult Function()?  confirmInvest,TResult Function()?  goToDashboard,TResult Function( OnboardingScreen tab)?  switchTab,TResult Function( String amountId)?  investAmountSelected,TResult Function( String amount)?  investCustomAmountChanged,TResult Function( String fundKey)?  investFundSelected,TResult Function()?  confirmInvestMore,TResult Function()?  investAgain,TResult Function( String amountId)?  sipAmountSelected,TResult Function( String amount)?  sipCustomAmountChanged,TResult Function( String fundKey)?  sipFundSelected,TResult Function( String date)?  sipDateSelected,TResult Function()?  confirmSip,TResult Function()?  editSip,TResult Function()?  restart,TResult Function()?  goBack,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StartFlow() when startFlow != null:
return startFlow();case StartSignIn() when startSignIn != null:
return startSignIn();case NameChanged() when nameChanged != null:
return nameChanged(_that.name);case PhoneChanged() when phoneChanged != null:
return phoneChanged(_that.phone);case OtpChanged() when otpChanged != null:
return otpChanged(_that.otp);case SubmitSignup() when submitSignup != null:
return submitSignup();case ResendOtp() when resendOtp != null:
return resendOtp();case VerifyOtp() when verifyOtp != null:
return verifyOtp();case GoalSelected() when goalSelected != null:
return goalSelected(_that.goalId);case ContinueFromGoalSelect() when continueFromGoalSelect != null:
return continueFromGoalSelect();case SkipGoalSelect() when skipGoalSelect != null:
return skipGoalSelect();case AmountSelected() when amountSelected != null:
return amountSelected(_that.amountId);case CustomAmountChanged() when customAmountChanged != null:
return customAmountChanged(_that.amount);case TimeframeSelected() when timeframeSelected != null:
return timeframeSelected(_that.timeframeId);case ContinueFromGoalDetail() when continueFromGoalDetail != null:
return continueFromGoalDetail();case AddAnotherGoal() when addAnotherGoal != null:
return addAnotherGoal();case ContinueFromGoalsReview() when continueFromGoalsReview != null:
return continueFromGoalsReview();case QuizAnswered() when quizAnswered != null:
return quizAnswered(_that.optionIndex,_that.score);case QuizAdvanceAfterAnswer() when quizAdvanceAfterAnswer != null:
return quizAdvanceAfterAnswer();case GoToRmIntro() when goToRmIntro != null:
return goToRmIntro();case RmIntroAutoAdvance() when rmIntroAutoAdvance != null:
return rmIntroAutoAdvance();case RmSelected() when rmSelected != null:
return rmSelected(_that.rmId);case ContinueFromRmSelect() when continueFromRmSelect != null:
return continueFromRmSelect();case ContinueFromRmConfirmed() when continueFromRmConfirmed != null:
return continueFromRmConfirmed();case ConfirmInvest() when confirmInvest != null:
return confirmInvest();case GoToDashboard() when goToDashboard != null:
return goToDashboard();case SwitchTab() when switchTab != null:
return switchTab(_that.tab);case InvestAmountSelected() when investAmountSelected != null:
return investAmountSelected(_that.amountId);case InvestCustomAmountChanged() when investCustomAmountChanged != null:
return investCustomAmountChanged(_that.amount);case InvestFundSelected() when investFundSelected != null:
return investFundSelected(_that.fundKey);case ConfirmInvestMore() when confirmInvestMore != null:
return confirmInvestMore();case InvestAgain() when investAgain != null:
return investAgain();case SipAmountSelected() when sipAmountSelected != null:
return sipAmountSelected(_that.amountId);case SipCustomAmountChanged() when sipCustomAmountChanged != null:
return sipCustomAmountChanged(_that.amount);case SipFundSelected() when sipFundSelected != null:
return sipFundSelected(_that.fundKey);case SipDateSelected() when sipDateSelected != null:
return sipDateSelected(_that.date);case ConfirmSip() when confirmSip != null:
return confirmSip();case EditSip() when editSip != null:
return editSip();case Restart() when restart != null:
return restart();case GoBack() when goBack != null:
return goBack();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  startFlow,required TResult Function()  startSignIn,required TResult Function( String name)  nameChanged,required TResult Function( String phone)  phoneChanged,required TResult Function( String otp)  otpChanged,required TResult Function()  submitSignup,required TResult Function()  resendOtp,required TResult Function()  verifyOtp,required TResult Function( String goalId)  goalSelected,required TResult Function()  continueFromGoalSelect,required TResult Function()  skipGoalSelect,required TResult Function( String amountId)  amountSelected,required TResult Function( String amount)  customAmountChanged,required TResult Function( String timeframeId)  timeframeSelected,required TResult Function()  continueFromGoalDetail,required TResult Function()  addAnotherGoal,required TResult Function()  continueFromGoalsReview,required TResult Function( int optionIndex,  int score)  quizAnswered,required TResult Function()  quizAdvanceAfterAnswer,required TResult Function()  goToRmIntro,required TResult Function()  rmIntroAutoAdvance,required TResult Function( String rmId)  rmSelected,required TResult Function()  continueFromRmSelect,required TResult Function()  continueFromRmConfirmed,required TResult Function()  confirmInvest,required TResult Function()  goToDashboard,required TResult Function( OnboardingScreen tab)  switchTab,required TResult Function( String amountId)  investAmountSelected,required TResult Function( String amount)  investCustomAmountChanged,required TResult Function( String fundKey)  investFundSelected,required TResult Function()  confirmInvestMore,required TResult Function()  investAgain,required TResult Function( String amountId)  sipAmountSelected,required TResult Function( String amount)  sipCustomAmountChanged,required TResult Function( String fundKey)  sipFundSelected,required TResult Function( String date)  sipDateSelected,required TResult Function()  confirmSip,required TResult Function()  editSip,required TResult Function()  restart,required TResult Function()  goBack,}) {final _that = this;
switch (_that) {
case StartFlow():
return startFlow();case StartSignIn():
return startSignIn();case NameChanged():
return nameChanged(_that.name);case PhoneChanged():
return phoneChanged(_that.phone);case OtpChanged():
return otpChanged(_that.otp);case SubmitSignup():
return submitSignup();case ResendOtp():
return resendOtp();case VerifyOtp():
return verifyOtp();case GoalSelected():
return goalSelected(_that.goalId);case ContinueFromGoalSelect():
return continueFromGoalSelect();case SkipGoalSelect():
return skipGoalSelect();case AmountSelected():
return amountSelected(_that.amountId);case CustomAmountChanged():
return customAmountChanged(_that.amount);case TimeframeSelected():
return timeframeSelected(_that.timeframeId);case ContinueFromGoalDetail():
return continueFromGoalDetail();case AddAnotherGoal():
return addAnotherGoal();case ContinueFromGoalsReview():
return continueFromGoalsReview();case QuizAnswered():
return quizAnswered(_that.optionIndex,_that.score);case QuizAdvanceAfterAnswer():
return quizAdvanceAfterAnswer();case GoToRmIntro():
return goToRmIntro();case RmIntroAutoAdvance():
return rmIntroAutoAdvance();case RmSelected():
return rmSelected(_that.rmId);case ContinueFromRmSelect():
return continueFromRmSelect();case ContinueFromRmConfirmed():
return continueFromRmConfirmed();case ConfirmInvest():
return confirmInvest();case GoToDashboard():
return goToDashboard();case SwitchTab():
return switchTab(_that.tab);case InvestAmountSelected():
return investAmountSelected(_that.amountId);case InvestCustomAmountChanged():
return investCustomAmountChanged(_that.amount);case InvestFundSelected():
return investFundSelected(_that.fundKey);case ConfirmInvestMore():
return confirmInvestMore();case InvestAgain():
return investAgain();case SipAmountSelected():
return sipAmountSelected(_that.amountId);case SipCustomAmountChanged():
return sipCustomAmountChanged(_that.amount);case SipFundSelected():
return sipFundSelected(_that.fundKey);case SipDateSelected():
return sipDateSelected(_that.date);case ConfirmSip():
return confirmSip();case EditSip():
return editSip();case Restart():
return restart();case GoBack():
return goBack();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  startFlow,TResult? Function()?  startSignIn,TResult? Function( String name)?  nameChanged,TResult? Function( String phone)?  phoneChanged,TResult? Function( String otp)?  otpChanged,TResult? Function()?  submitSignup,TResult? Function()?  resendOtp,TResult? Function()?  verifyOtp,TResult? Function( String goalId)?  goalSelected,TResult? Function()?  continueFromGoalSelect,TResult? Function()?  skipGoalSelect,TResult? Function( String amountId)?  amountSelected,TResult? Function( String amount)?  customAmountChanged,TResult? Function( String timeframeId)?  timeframeSelected,TResult? Function()?  continueFromGoalDetail,TResult? Function()?  addAnotherGoal,TResult? Function()?  continueFromGoalsReview,TResult? Function( int optionIndex,  int score)?  quizAnswered,TResult? Function()?  quizAdvanceAfterAnswer,TResult? Function()?  goToRmIntro,TResult? Function()?  rmIntroAutoAdvance,TResult? Function( String rmId)?  rmSelected,TResult? Function()?  continueFromRmSelect,TResult? Function()?  continueFromRmConfirmed,TResult? Function()?  confirmInvest,TResult? Function()?  goToDashboard,TResult? Function( OnboardingScreen tab)?  switchTab,TResult? Function( String amountId)?  investAmountSelected,TResult? Function( String amount)?  investCustomAmountChanged,TResult? Function( String fundKey)?  investFundSelected,TResult? Function()?  confirmInvestMore,TResult? Function()?  investAgain,TResult? Function( String amountId)?  sipAmountSelected,TResult? Function( String amount)?  sipCustomAmountChanged,TResult? Function( String fundKey)?  sipFundSelected,TResult? Function( String date)?  sipDateSelected,TResult? Function()?  confirmSip,TResult? Function()?  editSip,TResult? Function()?  restart,TResult? Function()?  goBack,}) {final _that = this;
switch (_that) {
case StartFlow() when startFlow != null:
return startFlow();case StartSignIn() when startSignIn != null:
return startSignIn();case NameChanged() when nameChanged != null:
return nameChanged(_that.name);case PhoneChanged() when phoneChanged != null:
return phoneChanged(_that.phone);case OtpChanged() when otpChanged != null:
return otpChanged(_that.otp);case SubmitSignup() when submitSignup != null:
return submitSignup();case ResendOtp() when resendOtp != null:
return resendOtp();case VerifyOtp() when verifyOtp != null:
return verifyOtp();case GoalSelected() when goalSelected != null:
return goalSelected(_that.goalId);case ContinueFromGoalSelect() when continueFromGoalSelect != null:
return continueFromGoalSelect();case SkipGoalSelect() when skipGoalSelect != null:
return skipGoalSelect();case AmountSelected() when amountSelected != null:
return amountSelected(_that.amountId);case CustomAmountChanged() when customAmountChanged != null:
return customAmountChanged(_that.amount);case TimeframeSelected() when timeframeSelected != null:
return timeframeSelected(_that.timeframeId);case ContinueFromGoalDetail() when continueFromGoalDetail != null:
return continueFromGoalDetail();case AddAnotherGoal() when addAnotherGoal != null:
return addAnotherGoal();case ContinueFromGoalsReview() when continueFromGoalsReview != null:
return continueFromGoalsReview();case QuizAnswered() when quizAnswered != null:
return quizAnswered(_that.optionIndex,_that.score);case QuizAdvanceAfterAnswer() when quizAdvanceAfterAnswer != null:
return quizAdvanceAfterAnswer();case GoToRmIntro() when goToRmIntro != null:
return goToRmIntro();case RmIntroAutoAdvance() when rmIntroAutoAdvance != null:
return rmIntroAutoAdvance();case RmSelected() when rmSelected != null:
return rmSelected(_that.rmId);case ContinueFromRmSelect() when continueFromRmSelect != null:
return continueFromRmSelect();case ContinueFromRmConfirmed() when continueFromRmConfirmed != null:
return continueFromRmConfirmed();case ConfirmInvest() when confirmInvest != null:
return confirmInvest();case GoToDashboard() when goToDashboard != null:
return goToDashboard();case SwitchTab() when switchTab != null:
return switchTab(_that.tab);case InvestAmountSelected() when investAmountSelected != null:
return investAmountSelected(_that.amountId);case InvestCustomAmountChanged() when investCustomAmountChanged != null:
return investCustomAmountChanged(_that.amount);case InvestFundSelected() when investFundSelected != null:
return investFundSelected(_that.fundKey);case ConfirmInvestMore() when confirmInvestMore != null:
return confirmInvestMore();case InvestAgain() when investAgain != null:
return investAgain();case SipAmountSelected() when sipAmountSelected != null:
return sipAmountSelected(_that.amountId);case SipCustomAmountChanged() when sipCustomAmountChanged != null:
return sipCustomAmountChanged(_that.amount);case SipFundSelected() when sipFundSelected != null:
return sipFundSelected(_that.fundKey);case SipDateSelected() when sipDateSelected != null:
return sipDateSelected(_that.date);case ConfirmSip() when confirmSip != null:
return confirmSip();case EditSip() when editSip != null:
return editSip();case Restart() when restart != null:
return restart();case GoBack() when goBack != null:
return goBack();case _:
  return null;

}
}

}

/// @nodoc


class StartFlow implements OnboardingEvent {
  const StartFlow();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartFlow);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.startFlow()';
}


}




/// @nodoc


class StartSignIn implements OnboardingEvent {
  const StartSignIn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartSignIn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.startSignIn()';
}


}




/// @nodoc


class NameChanged implements OnboardingEvent {
  const NameChanged(this.name);
  

 final  String name;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NameChangedCopyWith<NameChanged> get copyWith => _$NameChangedCopyWithImpl<NameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NameChanged&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'OnboardingEvent.nameChanged(name: $name)';
}


}

/// @nodoc
abstract mixin class $NameChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $NameChangedCopyWith(NameChanged value, $Res Function(NameChanged) _then) = _$NameChangedCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$NameChangedCopyWithImpl<$Res>
    implements $NameChangedCopyWith<$Res> {
  _$NameChangedCopyWithImpl(this._self, this._then);

  final NameChanged _self;
  final $Res Function(NameChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(NameChanged(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PhoneChanged implements OnboardingEvent {
  const PhoneChanged(this.phone);
  

 final  String phone;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneChangedCopyWith<PhoneChanged> get copyWith => _$PhoneChangedCopyWithImpl<PhoneChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneChanged&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'OnboardingEvent.phoneChanged(phone: $phone)';
}


}

/// @nodoc
abstract mixin class $PhoneChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $PhoneChangedCopyWith(PhoneChanged value, $Res Function(PhoneChanged) _then) = _$PhoneChangedCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class _$PhoneChangedCopyWithImpl<$Res>
    implements $PhoneChangedCopyWith<$Res> {
  _$PhoneChangedCopyWithImpl(this._self, this._then);

  final PhoneChanged _self;
  final $Res Function(PhoneChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(PhoneChanged(
null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OtpChanged implements OnboardingEvent {
  const OtpChanged(this.otp);
  

 final  String otp;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpChangedCopyWith<OtpChanged> get copyWith => _$OtpChangedCopyWithImpl<OtpChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpChanged&&(identical(other.otp, otp) || other.otp == otp));
}


@override
int get hashCode => Object.hash(runtimeType,otp);

@override
String toString() {
  return 'OnboardingEvent.otpChanged(otp: $otp)';
}


}

/// @nodoc
abstract mixin class $OtpChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OtpChangedCopyWith(OtpChanged value, $Res Function(OtpChanged) _then) = _$OtpChangedCopyWithImpl;
@useResult
$Res call({
 String otp
});




}
/// @nodoc
class _$OtpChangedCopyWithImpl<$Res>
    implements $OtpChangedCopyWith<$Res> {
  _$OtpChangedCopyWithImpl(this._self, this._then);

  final OtpChanged _self;
  final $Res Function(OtpChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? otp = null,}) {
  return _then(OtpChanged(
null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SubmitSignup implements OnboardingEvent {
  const SubmitSignup();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitSignup);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.submitSignup()';
}


}




/// @nodoc


class ResendOtp implements OnboardingEvent {
  const ResendOtp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendOtp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.resendOtp()';
}


}




/// @nodoc


class VerifyOtp implements OnboardingEvent {
  const VerifyOtp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.verifyOtp()';
}


}




/// @nodoc


class GoalSelected implements OnboardingEvent {
  const GoalSelected(this.goalId);
  

 final  String goalId;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalSelectedCopyWith<GoalSelected> get copyWith => _$GoalSelectedCopyWithImpl<GoalSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalSelected&&(identical(other.goalId, goalId) || other.goalId == goalId));
}


@override
int get hashCode => Object.hash(runtimeType,goalId);

@override
String toString() {
  return 'OnboardingEvent.goalSelected(goalId: $goalId)';
}


}

/// @nodoc
abstract mixin class $GoalSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $GoalSelectedCopyWith(GoalSelected value, $Res Function(GoalSelected) _then) = _$GoalSelectedCopyWithImpl;
@useResult
$Res call({
 String goalId
});




}
/// @nodoc
class _$GoalSelectedCopyWithImpl<$Res>
    implements $GoalSelectedCopyWith<$Res> {
  _$GoalSelectedCopyWithImpl(this._self, this._then);

  final GoalSelected _self;
  final $Res Function(GoalSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goalId = null,}) {
  return _then(GoalSelected(
null == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ContinueFromGoalSelect implements OnboardingEvent {
  const ContinueFromGoalSelect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueFromGoalSelect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.continueFromGoalSelect()';
}


}




/// @nodoc


class SkipGoalSelect implements OnboardingEvent {
  const SkipGoalSelect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkipGoalSelect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.skipGoalSelect()';
}


}




/// @nodoc


class AmountSelected implements OnboardingEvent {
  const AmountSelected(this.amountId);
  

 final  String amountId;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountSelectedCopyWith<AmountSelected> get copyWith => _$AmountSelectedCopyWithImpl<AmountSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountSelected&&(identical(other.amountId, amountId) || other.amountId == amountId));
}


@override
int get hashCode => Object.hash(runtimeType,amountId);

@override
String toString() {
  return 'OnboardingEvent.amountSelected(amountId: $amountId)';
}


}

/// @nodoc
abstract mixin class $AmountSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $AmountSelectedCopyWith(AmountSelected value, $Res Function(AmountSelected) _then) = _$AmountSelectedCopyWithImpl;
@useResult
$Res call({
 String amountId
});




}
/// @nodoc
class _$AmountSelectedCopyWithImpl<$Res>
    implements $AmountSelectedCopyWith<$Res> {
  _$AmountSelectedCopyWithImpl(this._self, this._then);

  final AmountSelected _self;
  final $Res Function(AmountSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amountId = null,}) {
  return _then(AmountSelected(
null == amountId ? _self.amountId : amountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CustomAmountChanged implements OnboardingEvent {
  const CustomAmountChanged(this.amount);
  

 final  String amount;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomAmountChangedCopyWith<CustomAmountChanged> get copyWith => _$CustomAmountChangedCopyWithImpl<CustomAmountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomAmountChanged&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'OnboardingEvent.customAmountChanged(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $CustomAmountChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $CustomAmountChangedCopyWith(CustomAmountChanged value, $Res Function(CustomAmountChanged) _then) = _$CustomAmountChangedCopyWithImpl;
@useResult
$Res call({
 String amount
});




}
/// @nodoc
class _$CustomAmountChangedCopyWithImpl<$Res>
    implements $CustomAmountChangedCopyWith<$Res> {
  _$CustomAmountChangedCopyWithImpl(this._self, this._then);

  final CustomAmountChanged _self;
  final $Res Function(CustomAmountChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(CustomAmountChanged(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TimeframeSelected implements OnboardingEvent {
  const TimeframeSelected(this.timeframeId);
  

 final  String timeframeId;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeframeSelectedCopyWith<TimeframeSelected> get copyWith => _$TimeframeSelectedCopyWithImpl<TimeframeSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeframeSelected&&(identical(other.timeframeId, timeframeId) || other.timeframeId == timeframeId));
}


@override
int get hashCode => Object.hash(runtimeType,timeframeId);

@override
String toString() {
  return 'OnboardingEvent.timeframeSelected(timeframeId: $timeframeId)';
}


}

/// @nodoc
abstract mixin class $TimeframeSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $TimeframeSelectedCopyWith(TimeframeSelected value, $Res Function(TimeframeSelected) _then) = _$TimeframeSelectedCopyWithImpl;
@useResult
$Res call({
 String timeframeId
});




}
/// @nodoc
class _$TimeframeSelectedCopyWithImpl<$Res>
    implements $TimeframeSelectedCopyWith<$Res> {
  _$TimeframeSelectedCopyWithImpl(this._self, this._then);

  final TimeframeSelected _self;
  final $Res Function(TimeframeSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timeframeId = null,}) {
  return _then(TimeframeSelected(
null == timeframeId ? _self.timeframeId : timeframeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ContinueFromGoalDetail implements OnboardingEvent {
  const ContinueFromGoalDetail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueFromGoalDetail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.continueFromGoalDetail()';
}


}




/// @nodoc


class AddAnotherGoal implements OnboardingEvent {
  const AddAnotherGoal();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAnotherGoal);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.addAnotherGoal()';
}


}




/// @nodoc


class ContinueFromGoalsReview implements OnboardingEvent {
  const ContinueFromGoalsReview();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueFromGoalsReview);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.continueFromGoalsReview()';
}


}




/// @nodoc


class QuizAnswered implements OnboardingEvent {
  const QuizAnswered({required this.optionIndex, required this.score});
  

 final  int optionIndex;
 final  int score;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAnsweredCopyWith<QuizAnswered> get copyWith => _$QuizAnsweredCopyWithImpl<QuizAnswered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAnswered&&(identical(other.optionIndex, optionIndex) || other.optionIndex == optionIndex)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,optionIndex,score);

@override
String toString() {
  return 'OnboardingEvent.quizAnswered(optionIndex: $optionIndex, score: $score)';
}


}

/// @nodoc
abstract mixin class $QuizAnsweredCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $QuizAnsweredCopyWith(QuizAnswered value, $Res Function(QuizAnswered) _then) = _$QuizAnsweredCopyWithImpl;
@useResult
$Res call({
 int optionIndex, int score
});




}
/// @nodoc
class _$QuizAnsweredCopyWithImpl<$Res>
    implements $QuizAnsweredCopyWith<$Res> {
  _$QuizAnsweredCopyWithImpl(this._self, this._then);

  final QuizAnswered _self;
  final $Res Function(QuizAnswered) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? optionIndex = null,Object? score = null,}) {
  return _then(QuizAnswered(
optionIndex: null == optionIndex ? _self.optionIndex : optionIndex // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class QuizAdvanceAfterAnswer implements OnboardingEvent {
  const QuizAdvanceAfterAnswer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAdvanceAfterAnswer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.quizAdvanceAfterAnswer()';
}


}




/// @nodoc


class GoToRmIntro implements OnboardingEvent {
  const GoToRmIntro();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoToRmIntro);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.goToRmIntro()';
}


}




/// @nodoc


class RmIntroAutoAdvance implements OnboardingEvent {
  const RmIntroAutoAdvance();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RmIntroAutoAdvance);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.rmIntroAutoAdvance()';
}


}




/// @nodoc


class RmSelected implements OnboardingEvent {
  const RmSelected(this.rmId);
  

 final  String rmId;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RmSelectedCopyWith<RmSelected> get copyWith => _$RmSelectedCopyWithImpl<RmSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RmSelected&&(identical(other.rmId, rmId) || other.rmId == rmId));
}


@override
int get hashCode => Object.hash(runtimeType,rmId);

@override
String toString() {
  return 'OnboardingEvent.rmSelected(rmId: $rmId)';
}


}

/// @nodoc
abstract mixin class $RmSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $RmSelectedCopyWith(RmSelected value, $Res Function(RmSelected) _then) = _$RmSelectedCopyWithImpl;
@useResult
$Res call({
 String rmId
});




}
/// @nodoc
class _$RmSelectedCopyWithImpl<$Res>
    implements $RmSelectedCopyWith<$Res> {
  _$RmSelectedCopyWithImpl(this._self, this._then);

  final RmSelected _self;
  final $Res Function(RmSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rmId = null,}) {
  return _then(RmSelected(
null == rmId ? _self.rmId : rmId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ContinueFromRmSelect implements OnboardingEvent {
  const ContinueFromRmSelect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueFromRmSelect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.continueFromRmSelect()';
}


}




/// @nodoc


class ContinueFromRmConfirmed implements OnboardingEvent {
  const ContinueFromRmConfirmed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueFromRmConfirmed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.continueFromRmConfirmed()';
}


}




/// @nodoc


class ConfirmInvest implements OnboardingEvent {
  const ConfirmInvest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmInvest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.confirmInvest()';
}


}




/// @nodoc


class GoToDashboard implements OnboardingEvent {
  const GoToDashboard();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoToDashboard);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.goToDashboard()';
}


}




/// @nodoc


class SwitchTab implements OnboardingEvent {
  const SwitchTab(this.tab);
  

 final  OnboardingScreen tab;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SwitchTabCopyWith<SwitchTab> get copyWith => _$SwitchTabCopyWithImpl<SwitchTab>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SwitchTab&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,tab);

@override
String toString() {
  return 'OnboardingEvent.switchTab(tab: $tab)';
}


}

/// @nodoc
abstract mixin class $SwitchTabCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $SwitchTabCopyWith(SwitchTab value, $Res Function(SwitchTab) _then) = _$SwitchTabCopyWithImpl;
@useResult
$Res call({
 OnboardingScreen tab
});




}
/// @nodoc
class _$SwitchTabCopyWithImpl<$Res>
    implements $SwitchTabCopyWith<$Res> {
  _$SwitchTabCopyWithImpl(this._self, this._then);

  final SwitchTab _self;
  final $Res Function(SwitchTab) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tab = null,}) {
  return _then(SwitchTab(
null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as OnboardingScreen,
  ));
}


}

/// @nodoc


class InvestAmountSelected implements OnboardingEvent {
  const InvestAmountSelected(this.amountId);
  

 final  String amountId;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvestAmountSelectedCopyWith<InvestAmountSelected> get copyWith => _$InvestAmountSelectedCopyWithImpl<InvestAmountSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvestAmountSelected&&(identical(other.amountId, amountId) || other.amountId == amountId));
}


@override
int get hashCode => Object.hash(runtimeType,amountId);

@override
String toString() {
  return 'OnboardingEvent.investAmountSelected(amountId: $amountId)';
}


}

/// @nodoc
abstract mixin class $InvestAmountSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $InvestAmountSelectedCopyWith(InvestAmountSelected value, $Res Function(InvestAmountSelected) _then) = _$InvestAmountSelectedCopyWithImpl;
@useResult
$Res call({
 String amountId
});




}
/// @nodoc
class _$InvestAmountSelectedCopyWithImpl<$Res>
    implements $InvestAmountSelectedCopyWith<$Res> {
  _$InvestAmountSelectedCopyWithImpl(this._self, this._then);

  final InvestAmountSelected _self;
  final $Res Function(InvestAmountSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amountId = null,}) {
  return _then(InvestAmountSelected(
null == amountId ? _self.amountId : amountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InvestCustomAmountChanged implements OnboardingEvent {
  const InvestCustomAmountChanged(this.amount);
  

 final  String amount;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvestCustomAmountChangedCopyWith<InvestCustomAmountChanged> get copyWith => _$InvestCustomAmountChangedCopyWithImpl<InvestCustomAmountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvestCustomAmountChanged&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'OnboardingEvent.investCustomAmountChanged(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $InvestCustomAmountChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $InvestCustomAmountChangedCopyWith(InvestCustomAmountChanged value, $Res Function(InvestCustomAmountChanged) _then) = _$InvestCustomAmountChangedCopyWithImpl;
@useResult
$Res call({
 String amount
});




}
/// @nodoc
class _$InvestCustomAmountChangedCopyWithImpl<$Res>
    implements $InvestCustomAmountChangedCopyWith<$Res> {
  _$InvestCustomAmountChangedCopyWithImpl(this._self, this._then);

  final InvestCustomAmountChanged _self;
  final $Res Function(InvestCustomAmountChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(InvestCustomAmountChanged(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InvestFundSelected implements OnboardingEvent {
  const InvestFundSelected(this.fundKey);
  

 final  String fundKey;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvestFundSelectedCopyWith<InvestFundSelected> get copyWith => _$InvestFundSelectedCopyWithImpl<InvestFundSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvestFundSelected&&(identical(other.fundKey, fundKey) || other.fundKey == fundKey));
}


@override
int get hashCode => Object.hash(runtimeType,fundKey);

@override
String toString() {
  return 'OnboardingEvent.investFundSelected(fundKey: $fundKey)';
}


}

/// @nodoc
abstract mixin class $InvestFundSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $InvestFundSelectedCopyWith(InvestFundSelected value, $Res Function(InvestFundSelected) _then) = _$InvestFundSelectedCopyWithImpl;
@useResult
$Res call({
 String fundKey
});




}
/// @nodoc
class _$InvestFundSelectedCopyWithImpl<$Res>
    implements $InvestFundSelectedCopyWith<$Res> {
  _$InvestFundSelectedCopyWithImpl(this._self, this._then);

  final InvestFundSelected _self;
  final $Res Function(InvestFundSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fundKey = null,}) {
  return _then(InvestFundSelected(
null == fundKey ? _self.fundKey : fundKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfirmInvestMore implements OnboardingEvent {
  const ConfirmInvestMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmInvestMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.confirmInvestMore()';
}


}




/// @nodoc


class InvestAgain implements OnboardingEvent {
  const InvestAgain();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvestAgain);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.investAgain()';
}


}




/// @nodoc


class SipAmountSelected implements OnboardingEvent {
  const SipAmountSelected(this.amountId);
  

 final  String amountId;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SipAmountSelectedCopyWith<SipAmountSelected> get copyWith => _$SipAmountSelectedCopyWithImpl<SipAmountSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SipAmountSelected&&(identical(other.amountId, amountId) || other.amountId == amountId));
}


@override
int get hashCode => Object.hash(runtimeType,amountId);

@override
String toString() {
  return 'OnboardingEvent.sipAmountSelected(amountId: $amountId)';
}


}

/// @nodoc
abstract mixin class $SipAmountSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $SipAmountSelectedCopyWith(SipAmountSelected value, $Res Function(SipAmountSelected) _then) = _$SipAmountSelectedCopyWithImpl;
@useResult
$Res call({
 String amountId
});




}
/// @nodoc
class _$SipAmountSelectedCopyWithImpl<$Res>
    implements $SipAmountSelectedCopyWith<$Res> {
  _$SipAmountSelectedCopyWithImpl(this._self, this._then);

  final SipAmountSelected _self;
  final $Res Function(SipAmountSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amountId = null,}) {
  return _then(SipAmountSelected(
null == amountId ? _self.amountId : amountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SipCustomAmountChanged implements OnboardingEvent {
  const SipCustomAmountChanged(this.amount);
  

 final  String amount;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SipCustomAmountChangedCopyWith<SipCustomAmountChanged> get copyWith => _$SipCustomAmountChangedCopyWithImpl<SipCustomAmountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SipCustomAmountChanged&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'OnboardingEvent.sipCustomAmountChanged(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SipCustomAmountChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $SipCustomAmountChangedCopyWith(SipCustomAmountChanged value, $Res Function(SipCustomAmountChanged) _then) = _$SipCustomAmountChangedCopyWithImpl;
@useResult
$Res call({
 String amount
});




}
/// @nodoc
class _$SipCustomAmountChangedCopyWithImpl<$Res>
    implements $SipCustomAmountChangedCopyWith<$Res> {
  _$SipCustomAmountChangedCopyWithImpl(this._self, this._then);

  final SipCustomAmountChanged _self;
  final $Res Function(SipCustomAmountChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(SipCustomAmountChanged(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SipFundSelected implements OnboardingEvent {
  const SipFundSelected(this.fundKey);
  

 final  String fundKey;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SipFundSelectedCopyWith<SipFundSelected> get copyWith => _$SipFundSelectedCopyWithImpl<SipFundSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SipFundSelected&&(identical(other.fundKey, fundKey) || other.fundKey == fundKey));
}


@override
int get hashCode => Object.hash(runtimeType,fundKey);

@override
String toString() {
  return 'OnboardingEvent.sipFundSelected(fundKey: $fundKey)';
}


}

/// @nodoc
abstract mixin class $SipFundSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $SipFundSelectedCopyWith(SipFundSelected value, $Res Function(SipFundSelected) _then) = _$SipFundSelectedCopyWithImpl;
@useResult
$Res call({
 String fundKey
});




}
/// @nodoc
class _$SipFundSelectedCopyWithImpl<$Res>
    implements $SipFundSelectedCopyWith<$Res> {
  _$SipFundSelectedCopyWithImpl(this._self, this._then);

  final SipFundSelected _self;
  final $Res Function(SipFundSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fundKey = null,}) {
  return _then(SipFundSelected(
null == fundKey ? _self.fundKey : fundKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SipDateSelected implements OnboardingEvent {
  const SipDateSelected(this.date);
  

 final  String date;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SipDateSelectedCopyWith<SipDateSelected> get copyWith => _$SipDateSelectedCopyWithImpl<SipDateSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SipDateSelected&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'OnboardingEvent.sipDateSelected(date: $date)';
}


}

/// @nodoc
abstract mixin class $SipDateSelectedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $SipDateSelectedCopyWith(SipDateSelected value, $Res Function(SipDateSelected) _then) = _$SipDateSelectedCopyWithImpl;
@useResult
$Res call({
 String date
});




}
/// @nodoc
class _$SipDateSelectedCopyWithImpl<$Res>
    implements $SipDateSelectedCopyWith<$Res> {
  _$SipDateSelectedCopyWithImpl(this._self, this._then);

  final SipDateSelected _self;
  final $Res Function(SipDateSelected) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(SipDateSelected(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConfirmSip implements OnboardingEvent {
  const ConfirmSip();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmSip);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.confirmSip()';
}


}




/// @nodoc


class EditSip implements OnboardingEvent {
  const EditSip();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditSip);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.editSip()';
}


}




/// @nodoc


class Restart implements OnboardingEvent {
  const Restart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Restart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.restart()';
}


}




/// @nodoc


class GoBack implements OnboardingEvent {
  const GoBack();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoBack);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.goBack()';
}


}




/// @nodoc
mixin _$SipConfig {

 double get amount; String get fundKey; String get date;
/// Create a copy of SipConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SipConfigCopyWith<SipConfig> get copyWith => _$SipConfigCopyWithImpl<SipConfig>(this as SipConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SipConfig&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fundKey, fundKey) || other.fundKey == fundKey)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,amount,fundKey,date);

@override
String toString() {
  return 'SipConfig(amount: $amount, fundKey: $fundKey, date: $date)';
}


}

/// @nodoc
abstract mixin class $SipConfigCopyWith<$Res>  {
  factory $SipConfigCopyWith(SipConfig value, $Res Function(SipConfig) _then) = _$SipConfigCopyWithImpl;
@useResult
$Res call({
 double amount, String fundKey, String date
});




}
/// @nodoc
class _$SipConfigCopyWithImpl<$Res>
    implements $SipConfigCopyWith<$Res> {
  _$SipConfigCopyWithImpl(this._self, this._then);

  final SipConfig _self;
  final $Res Function(SipConfig) _then;

/// Create a copy of SipConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? fundKey = null,Object? date = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,fundKey: null == fundKey ? _self.fundKey : fundKey // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SipConfig].
extension SipConfigPatterns on SipConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SipConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SipConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SipConfig value)  $default,){
final _that = this;
switch (_that) {
case _SipConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SipConfig value)?  $default,){
final _that = this;
switch (_that) {
case _SipConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String fundKey,  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SipConfig() when $default != null:
return $default(_that.amount,_that.fundKey,_that.date);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String fundKey,  String date)  $default,) {final _that = this;
switch (_that) {
case _SipConfig():
return $default(_that.amount,_that.fundKey,_that.date);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String fundKey,  String date)?  $default,) {final _that = this;
switch (_that) {
case _SipConfig() when $default != null:
return $default(_that.amount,_that.fundKey,_that.date);case _:
  return null;

}
}

}

/// @nodoc


class _SipConfig implements SipConfig {
  const _SipConfig({required this.amount, required this.fundKey, required this.date});
  

@override final  double amount;
@override final  String fundKey;
@override final  String date;

/// Create a copy of SipConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SipConfigCopyWith<_SipConfig> get copyWith => __$SipConfigCopyWithImpl<_SipConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SipConfig&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fundKey, fundKey) || other.fundKey == fundKey)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,amount,fundKey,date);

@override
String toString() {
  return 'SipConfig(amount: $amount, fundKey: $fundKey, date: $date)';
}


}

/// @nodoc
abstract mixin class _$SipConfigCopyWith<$Res> implements $SipConfigCopyWith<$Res> {
  factory _$SipConfigCopyWith(_SipConfig value, $Res Function(_SipConfig) _then) = __$SipConfigCopyWithImpl;
@override @useResult
$Res call({
 double amount, String fundKey, String date
});




}
/// @nodoc
class __$SipConfigCopyWithImpl<$Res>
    implements _$SipConfigCopyWith<$Res> {
  __$SipConfigCopyWithImpl(this._self, this._then);

  final _SipConfig _self;
  final $Res Function(_SipConfig) _then;

/// Create a copy of SipConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? fundKey = null,Object? date = null,}) {
  return _then(_SipConfig(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,fundKey: null == fundKey ? _self.fundKey : fundKey // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$OnboardingState {

 OnboardingScreen get screen; bool get isReturningUser; bool get isBusy; String get name; String get phone; String get otp; String? get selectedGoalId; String? get amountId; String get customAmount; String? get timeframeId; int get quizStep; Map<int, int> get quizAnswers; int? get quizSelectedOption; String? get selectedRmId; Map<String, double> get extraInvestments; String? get investAmountId; String get investCustomAmount; String? get investFundKey; bool get investConfirmed; double? get lastInvestAmount; String? get lastInvestFundKey; SipConfig? get sip; String? get sipAmountId; String get sipCustomAmount; String? get sipFundKey; String? get sipDate; bool get sipJustConfirmed; OnboardingScreen get activeTab;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.screen, screen) || other.screen == screen)&&(identical(other.isReturningUser, isReturningUser) || other.isReturningUser == isReturningUser)&&(identical(other.isBusy, isBusy) || other.isBusy == isBusy)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.selectedGoalId, selectedGoalId) || other.selectedGoalId == selectedGoalId)&&(identical(other.amountId, amountId) || other.amountId == amountId)&&(identical(other.customAmount, customAmount) || other.customAmount == customAmount)&&(identical(other.timeframeId, timeframeId) || other.timeframeId == timeframeId)&&(identical(other.quizStep, quizStep) || other.quizStep == quizStep)&&const DeepCollectionEquality().equals(other.quizAnswers, quizAnswers)&&(identical(other.quizSelectedOption, quizSelectedOption) || other.quizSelectedOption == quizSelectedOption)&&(identical(other.selectedRmId, selectedRmId) || other.selectedRmId == selectedRmId)&&const DeepCollectionEquality().equals(other.extraInvestments, extraInvestments)&&(identical(other.investAmountId, investAmountId) || other.investAmountId == investAmountId)&&(identical(other.investCustomAmount, investCustomAmount) || other.investCustomAmount == investCustomAmount)&&(identical(other.investFundKey, investFundKey) || other.investFundKey == investFundKey)&&(identical(other.investConfirmed, investConfirmed) || other.investConfirmed == investConfirmed)&&(identical(other.lastInvestAmount, lastInvestAmount) || other.lastInvestAmount == lastInvestAmount)&&(identical(other.lastInvestFundKey, lastInvestFundKey) || other.lastInvestFundKey == lastInvestFundKey)&&(identical(other.sip, sip) || other.sip == sip)&&(identical(other.sipAmountId, sipAmountId) || other.sipAmountId == sipAmountId)&&(identical(other.sipCustomAmount, sipCustomAmount) || other.sipCustomAmount == sipCustomAmount)&&(identical(other.sipFundKey, sipFundKey) || other.sipFundKey == sipFundKey)&&(identical(other.sipDate, sipDate) || other.sipDate == sipDate)&&(identical(other.sipJustConfirmed, sipJustConfirmed) || other.sipJustConfirmed == sipJustConfirmed)&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab));
}


@override
int get hashCode => Object.hashAll([runtimeType,screen,isReturningUser,isBusy,name,phone,otp,selectedGoalId,amountId,customAmount,timeframeId,quizStep,const DeepCollectionEquality().hash(quizAnswers),quizSelectedOption,selectedRmId,const DeepCollectionEquality().hash(extraInvestments),investAmountId,investCustomAmount,investFundKey,investConfirmed,lastInvestAmount,lastInvestFundKey,sip,sipAmountId,sipCustomAmount,sipFundKey,sipDate,sipJustConfirmed,activeTab]);

@override
String toString() {
  return 'OnboardingState(screen: $screen, isReturningUser: $isReturningUser, isBusy: $isBusy, name: $name, phone: $phone, otp: $otp, selectedGoalId: $selectedGoalId, amountId: $amountId, customAmount: $customAmount, timeframeId: $timeframeId, quizStep: $quizStep, quizAnswers: $quizAnswers, quizSelectedOption: $quizSelectedOption, selectedRmId: $selectedRmId, extraInvestments: $extraInvestments, investAmountId: $investAmountId, investCustomAmount: $investCustomAmount, investFundKey: $investFundKey, investConfirmed: $investConfirmed, lastInvestAmount: $lastInvestAmount, lastInvestFundKey: $lastInvestFundKey, sip: $sip, sipAmountId: $sipAmountId, sipCustomAmount: $sipCustomAmount, sipFundKey: $sipFundKey, sipDate: $sipDate, sipJustConfirmed: $sipJustConfirmed, activeTab: $activeTab)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 OnboardingScreen screen, bool isReturningUser, bool isBusy, String name, String phone, String otp, String? selectedGoalId, String? amountId, String customAmount, String? timeframeId, int quizStep, Map<int, int> quizAnswers, int? quizSelectedOption, String? selectedRmId, Map<String, double> extraInvestments, String? investAmountId, String investCustomAmount, String? investFundKey, bool investConfirmed, double? lastInvestAmount, String? lastInvestFundKey, SipConfig? sip, String? sipAmountId, String sipCustomAmount, String? sipFundKey, String? sipDate, bool sipJustConfirmed, OnboardingScreen activeTab
});


$SipConfigCopyWith<$Res>? get sip;

}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? screen = null,Object? isReturningUser = null,Object? isBusy = null,Object? name = null,Object? phone = null,Object? otp = null,Object? selectedGoalId = freezed,Object? amountId = freezed,Object? customAmount = null,Object? timeframeId = freezed,Object? quizStep = null,Object? quizAnswers = null,Object? quizSelectedOption = freezed,Object? selectedRmId = freezed,Object? extraInvestments = null,Object? investAmountId = freezed,Object? investCustomAmount = null,Object? investFundKey = freezed,Object? investConfirmed = null,Object? lastInvestAmount = freezed,Object? lastInvestFundKey = freezed,Object? sip = freezed,Object? sipAmountId = freezed,Object? sipCustomAmount = null,Object? sipFundKey = freezed,Object? sipDate = freezed,Object? sipJustConfirmed = null,Object? activeTab = null,}) {
  return _then(_self.copyWith(
screen: null == screen ? _self.screen : screen // ignore: cast_nullable_to_non_nullable
as OnboardingScreen,isReturningUser: null == isReturningUser ? _self.isReturningUser : isReturningUser // ignore: cast_nullable_to_non_nullable
as bool,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,selectedGoalId: freezed == selectedGoalId ? _self.selectedGoalId : selectedGoalId // ignore: cast_nullable_to_non_nullable
as String?,amountId: freezed == amountId ? _self.amountId : amountId // ignore: cast_nullable_to_non_nullable
as String?,customAmount: null == customAmount ? _self.customAmount : customAmount // ignore: cast_nullable_to_non_nullable
as String,timeframeId: freezed == timeframeId ? _self.timeframeId : timeframeId // ignore: cast_nullable_to_non_nullable
as String?,quizStep: null == quizStep ? _self.quizStep : quizStep // ignore: cast_nullable_to_non_nullable
as int,quizAnswers: null == quizAnswers ? _self.quizAnswers : quizAnswers // ignore: cast_nullable_to_non_nullable
as Map<int, int>,quizSelectedOption: freezed == quizSelectedOption ? _self.quizSelectedOption : quizSelectedOption // ignore: cast_nullable_to_non_nullable
as int?,selectedRmId: freezed == selectedRmId ? _self.selectedRmId : selectedRmId // ignore: cast_nullable_to_non_nullable
as String?,extraInvestments: null == extraInvestments ? _self.extraInvestments : extraInvestments // ignore: cast_nullable_to_non_nullable
as Map<String, double>,investAmountId: freezed == investAmountId ? _self.investAmountId : investAmountId // ignore: cast_nullable_to_non_nullable
as String?,investCustomAmount: null == investCustomAmount ? _self.investCustomAmount : investCustomAmount // ignore: cast_nullable_to_non_nullable
as String,investFundKey: freezed == investFundKey ? _self.investFundKey : investFundKey // ignore: cast_nullable_to_non_nullable
as String?,investConfirmed: null == investConfirmed ? _self.investConfirmed : investConfirmed // ignore: cast_nullable_to_non_nullable
as bool,lastInvestAmount: freezed == lastInvestAmount ? _self.lastInvestAmount : lastInvestAmount // ignore: cast_nullable_to_non_nullable
as double?,lastInvestFundKey: freezed == lastInvestFundKey ? _self.lastInvestFundKey : lastInvestFundKey // ignore: cast_nullable_to_non_nullable
as String?,sip: freezed == sip ? _self.sip : sip // ignore: cast_nullable_to_non_nullable
as SipConfig?,sipAmountId: freezed == sipAmountId ? _self.sipAmountId : sipAmountId // ignore: cast_nullable_to_non_nullable
as String?,sipCustomAmount: null == sipCustomAmount ? _self.sipCustomAmount : sipCustomAmount // ignore: cast_nullable_to_non_nullable
as String,sipFundKey: freezed == sipFundKey ? _self.sipFundKey : sipFundKey // ignore: cast_nullable_to_non_nullable
as String?,sipDate: freezed == sipDate ? _self.sipDate : sipDate // ignore: cast_nullable_to_non_nullable
as String?,sipJustConfirmed: null == sipJustConfirmed ? _self.sipJustConfirmed : sipJustConfirmed // ignore: cast_nullable_to_non_nullable
as bool,activeTab: null == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as OnboardingScreen,
  ));
}
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SipConfigCopyWith<$Res>? get sip {
    if (_self.sip == null) {
    return null;
  }

  return $SipConfigCopyWith<$Res>(_self.sip!, (value) {
    return _then(_self.copyWith(sip: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OnboardingScreen screen,  bool isReturningUser,  bool isBusy,  String name,  String phone,  String otp,  String? selectedGoalId,  String? amountId,  String customAmount,  String? timeframeId,  int quizStep,  Map<int, int> quizAnswers,  int? quizSelectedOption,  String? selectedRmId,  Map<String, double> extraInvestments,  String? investAmountId,  String investCustomAmount,  String? investFundKey,  bool investConfirmed,  double? lastInvestAmount,  String? lastInvestFundKey,  SipConfig? sip,  String? sipAmountId,  String sipCustomAmount,  String? sipFundKey,  String? sipDate,  bool sipJustConfirmed,  OnboardingScreen activeTab)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.screen,_that.isReturningUser,_that.isBusy,_that.name,_that.phone,_that.otp,_that.selectedGoalId,_that.amountId,_that.customAmount,_that.timeframeId,_that.quizStep,_that.quizAnswers,_that.quizSelectedOption,_that.selectedRmId,_that.extraInvestments,_that.investAmountId,_that.investCustomAmount,_that.investFundKey,_that.investConfirmed,_that.lastInvestAmount,_that.lastInvestFundKey,_that.sip,_that.sipAmountId,_that.sipCustomAmount,_that.sipFundKey,_that.sipDate,_that.sipJustConfirmed,_that.activeTab);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OnboardingScreen screen,  bool isReturningUser,  bool isBusy,  String name,  String phone,  String otp,  String? selectedGoalId,  String? amountId,  String customAmount,  String? timeframeId,  int quizStep,  Map<int, int> quizAnswers,  int? quizSelectedOption,  String? selectedRmId,  Map<String, double> extraInvestments,  String? investAmountId,  String investCustomAmount,  String? investFundKey,  bool investConfirmed,  double? lastInvestAmount,  String? lastInvestFundKey,  SipConfig? sip,  String? sipAmountId,  String sipCustomAmount,  String? sipFundKey,  String? sipDate,  bool sipJustConfirmed,  OnboardingScreen activeTab)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.screen,_that.isReturningUser,_that.isBusy,_that.name,_that.phone,_that.otp,_that.selectedGoalId,_that.amountId,_that.customAmount,_that.timeframeId,_that.quizStep,_that.quizAnswers,_that.quizSelectedOption,_that.selectedRmId,_that.extraInvestments,_that.investAmountId,_that.investCustomAmount,_that.investFundKey,_that.investConfirmed,_that.lastInvestAmount,_that.lastInvestFundKey,_that.sip,_that.sipAmountId,_that.sipCustomAmount,_that.sipFundKey,_that.sipDate,_that.sipJustConfirmed,_that.activeTab);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OnboardingScreen screen,  bool isReturningUser,  bool isBusy,  String name,  String phone,  String otp,  String? selectedGoalId,  String? amountId,  String customAmount,  String? timeframeId,  int quizStep,  Map<int, int> quizAnswers,  int? quizSelectedOption,  String? selectedRmId,  Map<String, double> extraInvestments,  String? investAmountId,  String investCustomAmount,  String? investFundKey,  bool investConfirmed,  double? lastInvestAmount,  String? lastInvestFundKey,  SipConfig? sip,  String? sipAmountId,  String sipCustomAmount,  String? sipFundKey,  String? sipDate,  bool sipJustConfirmed,  OnboardingScreen activeTab)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.screen,_that.isReturningUser,_that.isBusy,_that.name,_that.phone,_that.otp,_that.selectedGoalId,_that.amountId,_that.customAmount,_that.timeframeId,_that.quizStep,_that.quizAnswers,_that.quizSelectedOption,_that.selectedRmId,_that.extraInvestments,_that.investAmountId,_that.investCustomAmount,_that.investFundKey,_that.investConfirmed,_that.lastInvestAmount,_that.lastInvestFundKey,_that.sip,_that.sipAmountId,_that.sipCustomAmount,_that.sipFundKey,_that.sipDate,_that.sipJustConfirmed,_that.activeTab);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({this.screen = OnboardingScreen.splash, this.isReturningUser = false, this.isBusy = false, this.name = '', this.phone = '', this.otp = '', this.selectedGoalId, this.amountId, this.customAmount = '', this.timeframeId, this.quizStep = 0, final  Map<int, int> quizAnswers = const {}, this.quizSelectedOption, this.selectedRmId, final  Map<String, double> extraInvestments = const {'equity' : 0.0, 'hybrid' : 0.0, 'debt' : 0.0}, this.investAmountId, this.investCustomAmount = '', this.investFundKey, this.investConfirmed = false, this.lastInvestAmount, this.lastInvestFundKey, this.sip, this.sipAmountId, this.sipCustomAmount = '', this.sipFundKey, this.sipDate, this.sipJustConfirmed = false, this.activeTab = OnboardingScreen.dashboard}): _quizAnswers = quizAnswers,_extraInvestments = extraInvestments;
  

@override@JsonKey() final  OnboardingScreen screen;
@override@JsonKey() final  bool isReturningUser;
@override@JsonKey() final  bool isBusy;
@override@JsonKey() final  String name;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String otp;
@override final  String? selectedGoalId;
@override final  String? amountId;
@override@JsonKey() final  String customAmount;
@override final  String? timeframeId;
@override@JsonKey() final  int quizStep;
 final  Map<int, int> _quizAnswers;
@override@JsonKey() Map<int, int> get quizAnswers {
  if (_quizAnswers is EqualUnmodifiableMapView) return _quizAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_quizAnswers);
}

@override final  int? quizSelectedOption;
@override final  String? selectedRmId;
 final  Map<String, double> _extraInvestments;
@override@JsonKey() Map<String, double> get extraInvestments {
  if (_extraInvestments is EqualUnmodifiableMapView) return _extraInvestments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_extraInvestments);
}

@override final  String? investAmountId;
@override@JsonKey() final  String investCustomAmount;
@override final  String? investFundKey;
@override@JsonKey() final  bool investConfirmed;
@override final  double? lastInvestAmount;
@override final  String? lastInvestFundKey;
@override final  SipConfig? sip;
@override final  String? sipAmountId;
@override@JsonKey() final  String sipCustomAmount;
@override final  String? sipFundKey;
@override final  String? sipDate;
@override@JsonKey() final  bool sipJustConfirmed;
@override@JsonKey() final  OnboardingScreen activeTab;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.screen, screen) || other.screen == screen)&&(identical(other.isReturningUser, isReturningUser) || other.isReturningUser == isReturningUser)&&(identical(other.isBusy, isBusy) || other.isBusy == isBusy)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.selectedGoalId, selectedGoalId) || other.selectedGoalId == selectedGoalId)&&(identical(other.amountId, amountId) || other.amountId == amountId)&&(identical(other.customAmount, customAmount) || other.customAmount == customAmount)&&(identical(other.timeframeId, timeframeId) || other.timeframeId == timeframeId)&&(identical(other.quizStep, quizStep) || other.quizStep == quizStep)&&const DeepCollectionEquality().equals(other._quizAnswers, _quizAnswers)&&(identical(other.quizSelectedOption, quizSelectedOption) || other.quizSelectedOption == quizSelectedOption)&&(identical(other.selectedRmId, selectedRmId) || other.selectedRmId == selectedRmId)&&const DeepCollectionEquality().equals(other._extraInvestments, _extraInvestments)&&(identical(other.investAmountId, investAmountId) || other.investAmountId == investAmountId)&&(identical(other.investCustomAmount, investCustomAmount) || other.investCustomAmount == investCustomAmount)&&(identical(other.investFundKey, investFundKey) || other.investFundKey == investFundKey)&&(identical(other.investConfirmed, investConfirmed) || other.investConfirmed == investConfirmed)&&(identical(other.lastInvestAmount, lastInvestAmount) || other.lastInvestAmount == lastInvestAmount)&&(identical(other.lastInvestFundKey, lastInvestFundKey) || other.lastInvestFundKey == lastInvestFundKey)&&(identical(other.sip, sip) || other.sip == sip)&&(identical(other.sipAmountId, sipAmountId) || other.sipAmountId == sipAmountId)&&(identical(other.sipCustomAmount, sipCustomAmount) || other.sipCustomAmount == sipCustomAmount)&&(identical(other.sipFundKey, sipFundKey) || other.sipFundKey == sipFundKey)&&(identical(other.sipDate, sipDate) || other.sipDate == sipDate)&&(identical(other.sipJustConfirmed, sipJustConfirmed) || other.sipJustConfirmed == sipJustConfirmed)&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab));
}


@override
int get hashCode => Object.hashAll([runtimeType,screen,isReturningUser,isBusy,name,phone,otp,selectedGoalId,amountId,customAmount,timeframeId,quizStep,const DeepCollectionEquality().hash(_quizAnswers),quizSelectedOption,selectedRmId,const DeepCollectionEquality().hash(_extraInvestments),investAmountId,investCustomAmount,investFundKey,investConfirmed,lastInvestAmount,lastInvestFundKey,sip,sipAmountId,sipCustomAmount,sipFundKey,sipDate,sipJustConfirmed,activeTab]);

@override
String toString() {
  return 'OnboardingState(screen: $screen, isReturningUser: $isReturningUser, isBusy: $isBusy, name: $name, phone: $phone, otp: $otp, selectedGoalId: $selectedGoalId, amountId: $amountId, customAmount: $customAmount, timeframeId: $timeframeId, quizStep: $quizStep, quizAnswers: $quizAnswers, quizSelectedOption: $quizSelectedOption, selectedRmId: $selectedRmId, extraInvestments: $extraInvestments, investAmountId: $investAmountId, investCustomAmount: $investCustomAmount, investFundKey: $investFundKey, investConfirmed: $investConfirmed, lastInvestAmount: $lastInvestAmount, lastInvestFundKey: $lastInvestFundKey, sip: $sip, sipAmountId: $sipAmountId, sipCustomAmount: $sipCustomAmount, sipFundKey: $sipFundKey, sipDate: $sipDate, sipJustConfirmed: $sipJustConfirmed, activeTab: $activeTab)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 OnboardingScreen screen, bool isReturningUser, bool isBusy, String name, String phone, String otp, String? selectedGoalId, String? amountId, String customAmount, String? timeframeId, int quizStep, Map<int, int> quizAnswers, int? quizSelectedOption, String? selectedRmId, Map<String, double> extraInvestments, String? investAmountId, String investCustomAmount, String? investFundKey, bool investConfirmed, double? lastInvestAmount, String? lastInvestFundKey, SipConfig? sip, String? sipAmountId, String sipCustomAmount, String? sipFundKey, String? sipDate, bool sipJustConfirmed, OnboardingScreen activeTab
});


@override $SipConfigCopyWith<$Res>? get sip;

}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? screen = null,Object? isReturningUser = null,Object? isBusy = null,Object? name = null,Object? phone = null,Object? otp = null,Object? selectedGoalId = freezed,Object? amountId = freezed,Object? customAmount = null,Object? timeframeId = freezed,Object? quizStep = null,Object? quizAnswers = null,Object? quizSelectedOption = freezed,Object? selectedRmId = freezed,Object? extraInvestments = null,Object? investAmountId = freezed,Object? investCustomAmount = null,Object? investFundKey = freezed,Object? investConfirmed = null,Object? lastInvestAmount = freezed,Object? lastInvestFundKey = freezed,Object? sip = freezed,Object? sipAmountId = freezed,Object? sipCustomAmount = null,Object? sipFundKey = freezed,Object? sipDate = freezed,Object? sipJustConfirmed = null,Object? activeTab = null,}) {
  return _then(_OnboardingState(
screen: null == screen ? _self.screen : screen // ignore: cast_nullable_to_non_nullable
as OnboardingScreen,isReturningUser: null == isReturningUser ? _self.isReturningUser : isReturningUser // ignore: cast_nullable_to_non_nullable
as bool,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,selectedGoalId: freezed == selectedGoalId ? _self.selectedGoalId : selectedGoalId // ignore: cast_nullable_to_non_nullable
as String?,amountId: freezed == amountId ? _self.amountId : amountId // ignore: cast_nullable_to_non_nullable
as String?,customAmount: null == customAmount ? _self.customAmount : customAmount // ignore: cast_nullable_to_non_nullable
as String,timeframeId: freezed == timeframeId ? _self.timeframeId : timeframeId // ignore: cast_nullable_to_non_nullable
as String?,quizStep: null == quizStep ? _self.quizStep : quizStep // ignore: cast_nullable_to_non_nullable
as int,quizAnswers: null == quizAnswers ? _self._quizAnswers : quizAnswers // ignore: cast_nullable_to_non_nullable
as Map<int, int>,quizSelectedOption: freezed == quizSelectedOption ? _self.quizSelectedOption : quizSelectedOption // ignore: cast_nullable_to_non_nullable
as int?,selectedRmId: freezed == selectedRmId ? _self.selectedRmId : selectedRmId // ignore: cast_nullable_to_non_nullable
as String?,extraInvestments: null == extraInvestments ? _self._extraInvestments : extraInvestments // ignore: cast_nullable_to_non_nullable
as Map<String, double>,investAmountId: freezed == investAmountId ? _self.investAmountId : investAmountId // ignore: cast_nullable_to_non_nullable
as String?,investCustomAmount: null == investCustomAmount ? _self.investCustomAmount : investCustomAmount // ignore: cast_nullable_to_non_nullable
as String,investFundKey: freezed == investFundKey ? _self.investFundKey : investFundKey // ignore: cast_nullable_to_non_nullable
as String?,investConfirmed: null == investConfirmed ? _self.investConfirmed : investConfirmed // ignore: cast_nullable_to_non_nullable
as bool,lastInvestAmount: freezed == lastInvestAmount ? _self.lastInvestAmount : lastInvestAmount // ignore: cast_nullable_to_non_nullable
as double?,lastInvestFundKey: freezed == lastInvestFundKey ? _self.lastInvestFundKey : lastInvestFundKey // ignore: cast_nullable_to_non_nullable
as String?,sip: freezed == sip ? _self.sip : sip // ignore: cast_nullable_to_non_nullable
as SipConfig?,sipAmountId: freezed == sipAmountId ? _self.sipAmountId : sipAmountId // ignore: cast_nullable_to_non_nullable
as String?,sipCustomAmount: null == sipCustomAmount ? _self.sipCustomAmount : sipCustomAmount // ignore: cast_nullable_to_non_nullable
as String,sipFundKey: freezed == sipFundKey ? _self.sipFundKey : sipFundKey // ignore: cast_nullable_to_non_nullable
as String?,sipDate: freezed == sipDate ? _self.sipDate : sipDate // ignore: cast_nullable_to_non_nullable
as String?,sipJustConfirmed: null == sipJustConfirmed ? _self.sipJustConfirmed : sipJustConfirmed // ignore: cast_nullable_to_non_nullable
as bool,activeTab: null == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as OnboardingScreen,
  ));
}

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SipConfigCopyWith<$Res>? get sip {
    if (_self.sip == null) {
    return null;
  }

  return $SipConfigCopyWith<$Res>(_self.sip!, (value) {
    return _then(_self.copyWith(sip: value));
  });
}
}

// dart format on
