require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
    test 'render a list of products' do
        get products_path

        assert_response :success
        assert_select '.product', 2
    end

    test 'render a detailed product page' do
        get product_path(products(:ps4))

        assert_response :success
        assert_select '.title', 'PS4 Fat'
        assert_select '.description', 'PS4 en buen estado'
        assert_select '.price', '100'
    end

    test 'render a new product form' do
        get new_product_path

        assert_response :success
        assert_select 'form'
    end

    test 'allows to create a new product' do
        post products_path, params: {
            product: {
                title: 'Nintendo 64',
                description: 'Sin cables de conexión',
                price: 60
            }
        }

        assert_redirected_to products_path
    end
    
    test 'Does not allow to create a new product with empty field' do
        post products_path, params: {
            product: {
                title: '',
                description: 'Sin cables de conexión',
                price: 60
            }
        }

        assert_response :unprocessable_entity
    end
end