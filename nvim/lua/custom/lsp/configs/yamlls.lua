return {
  -- activate only for plain yaml files
  filetypes = { 'yaml', 'yaml.docker-compose' },
  event = 'BufEnter',

  -- lazy-load schemastore when needed
  on_new_config = function(new_config)
    new_config.settings.yaml.schemas = vim.tbl_deep_extend('force', new_config.settings.yaml.schemas or {}, require('schemastore').yaml.schemas())
  end,
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      validate = true,
      format = { enable = true },
      schemaStore = {
        enable = false,
        hover = true,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = '',
      },
      schemas = vim.tbl_deep_extend('force', require('schemastore').yaml.schemas(), {
        ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = {
          '**/docker-compose.yml',
          '**/docker-compose.yaml',
          '**/docker-compose.*.yml',
          '**/docker-compose.*.yaml',
          '**/compose.yml',
          '**/compose.yaml',
          '**/compose.*.yml',
          '**/compose.*.yaml',
        },
        -- ['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = {
        --   '/.gitlab-ci.yml',
        --   '/.gitlab-ci.yaml',
        -- },
      }),
    },
  },
}
