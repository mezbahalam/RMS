require 'rails_helper'
RSpec.describe SessionsController, type: :controller do
  describe "on POST to #create" do
    context "with good credentials" do
      before do
        @user = create(:user)
        @user.update_attribute :remember_token, "old-token"
        post :create, params: {
            session: { email: @user.email, password: @user.password },
        }
      end


      it "sets the user in the clearance session" do
        expect(request.env[:clearance].current_user).to eq @user
      end

      it "should not change the remember token" do
        expect(@user.reload.remember_token).to eq "old-token"
      end
    end

    context "with good credentials and a session return url" do
      it "redirects to the return URL maintaining query and fragment" do
        user = create(:user)
        return_url = "/url_in_the_session?foo=bar#baz"
        request.session[:return_to] = return_url

        post :create, params: {
            session: { email: user.email, password: user.password },
        }

        should redirect_to(return_url)
      end

      it "redirects to the return URL maintaining query without fragment" do
        user = create(:user)
        return_url = "/url_in_the_session?foo=bar"
        request.session[:return_to] = return_url

        post :create, params: {
            session: { email: user.email, password: user.password },
        }

        should redirect_to(return_url)
      end

      it "redirects to the return URL without query or fragment" do
        user = create(:user)
        return_url = "/url_in_the_session"
        request.session[:return_to] = return_url

        post :create, params: {
            session: { email: user.email, password: user.password },
        }

        should redirect_to(return_url)
      end
    end
  end

  describe "on DELETE to #destroy" do
    context "with a cookie" do
      before do
        @user = create(:user)
        @user.update_attribute :remember_token, "old-token"
        @request.cookies["remember_token"] = "old-token"
        delete :destroy
      end

      it "should reset the remember token" do
        expect(@user.reload.remember_token).not_to eq "old-token"
      end

      it "should unset the current user" do
        expect(request.env[:clearance].current_user).to be_nil
      end
    end
  end
end
