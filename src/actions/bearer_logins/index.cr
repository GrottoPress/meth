class BearerLogins::Index < BrowserAction
  include Shield::BearerLogins::Index

  param page : Int32 = 1

  get "/bearer-logins" do
    html IndexPage, bearer_logins: active_bearer_logins, pages: pages
  end

  private def active_bearer_logins
    bearer_logins.select &.active?
  end
end
