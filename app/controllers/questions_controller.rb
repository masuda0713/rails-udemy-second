class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
  end

  # 質問詳細表示
  def show
  end

  # 質問作成
  def new
    @question = Question.new # Questionモデルの新しいインスタンスを生成
  end

  # 質問登録
  def create
    # Questionモデルを初期化
    @question = Question.new(question_params)
    # QuestionモデルをDBへ保存
    @question.save
    # showへリダイレクト
    redirect_to @question
  end

  # 質問編集
  def edit
  end

  # 質問更新
  def update
  end

  # 質問削除
  def destroy
  end

  private
  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
