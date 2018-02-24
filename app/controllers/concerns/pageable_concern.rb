module PageableConcern
  extend ActiveSupport::Concern

  def paginate(collection, per_page = 20)
    @page = PageService.call(collection, params[:page], per_page)
    @next_page = @page.next_page
    @page.collection
  end
end
