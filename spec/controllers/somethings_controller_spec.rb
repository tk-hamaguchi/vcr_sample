require 'rails_helper'

RSpec.describe SomethingsController, type: :controller do
  context '#create' do
    context 'response' do
      subject { post :create ; response }
      it { is_expected.to have_http_status(:created) }
      context 'body' do
        subject { super().body }
        it { is_expected.to eq '{"hoge":{"id":1234,"fuga":"GAHAHAHA!"}}' }
      end
    end
  end
end
