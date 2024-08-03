-- fugitive-gitlab

local gitlab_domains = os.getenv("NVIM_FUGITIVE_GITLAB_DOMAINS")

if gitlab_domains then
    local fugitive_gitlab_domains = {}
    for pair in string.gmatch(gitlab_domains, "([^,]+)") do
        local key, value = string.match(pair, "(.+)=(.+)")
        if key and value then
            fugitive_gitlab_domains[key] = value
        end
    end
    vim.g.fugitive_gitlab_domains = fugitive_gitlab_domains
end

vim.g.fubitive_domain_pattern = "bb\\.yandexcloud\\.net"
