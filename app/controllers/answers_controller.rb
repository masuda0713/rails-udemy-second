class AnswersController < ApplicationController
  # 回答の登録
  def create
    # p params
    @question = Question.find(params[:question_id]) # Questionモデルからidを取得
    @question.answers.create(answer_params) # AnswerモデルをDBへ保存。question_idは自動的に設定される
    redirect_to question_path(@question) # showへリダイレクト
  end

  # 回答の削除
  def destroy
    @question = Question.find(params[:question_id]) # Questionモデルからidを取得
    @answer = @question.answers.find(params[:id]) # Answerモデルからidを取得
    @answer.destroy # 削除
    redirect_to @question, status: :see_other # 303リダイレクト
  end

  private
  def answer_params # ストロングパラメータ
    params.require(:answer).permit(:name, :content)  # Answerモデルのnameとcontentのみ許可
  end
end
