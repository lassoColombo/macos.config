-- yaml.docler=cpmpose
vim.filetype.add {
  filename = {
    ['docker-compose.yaml'] = 'yaml.docker-compose',
    ['docker-compose.yml'] = 'yaml.docker-compose',
    ['*docker-compose.yaml'] = 'yaml.docker-compose',
    ['*docker-compose.yml'] = 'yaml.docker-compose',
  },
}

vim.filetype.add {
  extension = {
    ['http'] = 'http',
  },
}
