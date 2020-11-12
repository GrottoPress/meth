class Home::IndexPage < MainLayout
  def page_title
    ""
  end

  def content
    h1 do
      text "Hello "
      em "Meth"
    end

    para "Meth is a rather quick way to get started with Lucky framework and Shield"

    h2 "Resources"

    ul do
      li do
        a "Shield", href: "https://github.com/grottopress/shield"
      end

      li do
        a "Meth", href: "https://github.com/grottopress/meth"
      end

      li do
        a "Lucky", href: "https://luckyframework.org"
      end

      li do
        a "Crystal", href: "https://crystal-lang.org"
      end
    end
  end
end
