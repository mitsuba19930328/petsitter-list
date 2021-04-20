require 'rails_helper'

RSpec.describe "Tops", type: :request do

  describe 'index' do
    context 'ログイン済みユーザーとして' do
      # ログイン下準備
      before 'ログインするための下準備' do
        @user = FactoryBot.create(:user)
      end

      it '正常にレスポンスを返すこと' do
        login_path @user
        get tops_index_path
        # expect(response).to have_http_status(200)
        expect(response).to be_successful
      end
    end

    context '未ログインユーザーとして' do
      it '正常にレスポンスを返すこと' do
        # get tops_index_path
        get tops_index_url
        # expect(response).to have_http_status(200)
        expect(response).to be_successful
      end
    end

  end
end
