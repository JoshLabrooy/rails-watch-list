class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create, :destroy]
  before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.create(bookmark_params.merge(list: @list))

    if @bookmark.persisted?
      redirect_to list_path(@list), notice: 'Bookmark was successfully added.'
    else
      render :new
    end
  end

  def destroy
    raise
    @bookmark.destroy
    redirect_to list_path(@list), notice: 'Bookmark was successfully removed.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
