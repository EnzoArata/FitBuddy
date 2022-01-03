class ArticlesController<ApplicationController

  def get
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
