module SitesHelper
    def setup_site(site)
      site.fruit_trees.build
      site
    end
end
