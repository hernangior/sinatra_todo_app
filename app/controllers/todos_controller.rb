# working version
class TodosController < ApplicationController
  # GET: /todos asking the server for the data in todo -- done
  get "/todos" do
    # if signed_in?
      @todos = Todo.all
      # binding.pry
      erb :"todos/index.html"
    # else
      # red/irect "/signin"
    # end
  end

  # GET: /todos/new -- done
  get "/todos/new" do
    # if signed_in?
      erb :"/todos/new.html"
    # else
      # redirect "/signin"
    # end
  end

  # POST: /todos --- done
  post "/todos" do
    # raise params.inspect
    #params {"chore"=>"raise params inspect"}
    # if signed_in?
    #   if params[:chore].empty?
      #   redirect "/todos/new"
      # else
        # @user = User.find_by(:id => session[:user_id])
        # create new instance of todo
        @todo = Todo.new
        # set the name of chore
        @todo.chore = params[:chore]
        # finally save it
        @todo.save
        # todo = Todo.create(chore: params[:chore], user_id: @user.id)
        # redirect to the show page, HTTP is stateless means instance variable in one action
        # will ever never relates to instance variable in another action
        redirect "/todos"
      # end
    # else
    #   redirect "/signin"
    # end
  end

  # GET: /todos/5
  get "/todos/:id/edit" do
    @todo = Todo.find(params[:id])
    # there is no relation between this line and line 37 it just bcz of redirecting due to design
    # those two values are the end up equals
    erb :"/todos/edit.html"
  end

  # update the todo : /todos/5 -- there is a bug delete the post instead of updating it
  patch "/todos/:id" do
    # raise params.inspect
    # fins the todo with the specific id
    @todo = Todo.find(params[:id])
    # binding.pry
    @todo.update(chore: params[:chore])
    # binding.pry
      redirect "/todos"
  end
  get "/todos/:id" do
    @todo = Todo.find(params[:id])
      erb :'/todos/edit.html'
  end
  # DELETE: /todos/5/delete
  delete "/todos/:id/delete" do
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect "/todos"
  end
end
