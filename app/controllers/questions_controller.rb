class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    @questions = Question.all # Questionモデルから全てのデータを取得
    # p @questions # デバッグ用のコンソール出力
  end

  # 質問詳細表示
  def show
    @question = Question.find(params[:id]) # Questionモデルからidを取得
    # p @question デバッグ用のコンソール出力
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
    if @question.save # 保存に成功した場合
      redirect_to @question # showへリダイレクト
    else # 保存に失敗した場合
      render 'new', status: :unprocessable_entity # 422エラー
    end
  end

  # 質問編集
  def edit
    @question = Question.find(params[:id]) # Questionモデルからidを取得
  end

  # 質問更新
  def update
    @question = Question.find(params[:id]) # Questionモデルからidを取得
    if @question.update(question_params) # 更新に成功した場合
      redirect_to @question # showへリダイレクト
    else # 更新に失敗した場合
      render 'edit', status: :unprocessable_entity # 422エラー
    end
  end

  # 質問削除
  def destroy
    @question = Question.find(params[:id]) # Questionモデルからidを取得
    @question.destroy # 削除
    redirect_to questions_path # indexへリダイレクト
  end

  private
  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
