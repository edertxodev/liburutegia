require 'test_helper'

class LibrosControllerTest < ActionController::TestCase
  setup do
    @libro = libros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:libros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create libro" do
    assert_difference('Libro.count') do
      post :create, libro: { autor: @libro.autor, fregistro: @libro.fregistro, genero: @libro.genero, isbn: @libro.isbn, portada: @libro.portada, titulo: @libro.titulo }
    end

    assert_redirected_to libro_path(assigns(:libro))
  end

  test "should show libro" do
    get :show, id: @libro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @libro
    assert_response :success
  end

  test "should update libro" do
    patch :update, id: @libro, libro: { autor: @libro.autor, fregistro: @libro.fregistro, genero: @libro.genero, isbn: @libro.isbn, portada: @libro.portada, titulo: @libro.titulo }
    assert_redirected_to libro_path(assigns(:libro))
  end

  test "should destroy libro" do
    assert_difference('Libro.count', -1) do
      delete :destroy, id: @libro
    end

    assert_redirected_to libros_path
  end
end
