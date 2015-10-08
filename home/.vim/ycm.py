def FlagsForFile(filename, **kwargs):

  flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-isystem',
    '/usr/include'
  ]

  data = kwargs['client_data']
  filetype = data['&filetype']

  if filetype == 'c':
    flags += ['-xc']
  elif filetype == 'cpp':
    flags += [
      '-xc++',
      '-std=c++11',
      '-isystem',
      '/usr/include/c++/v1'
    ]
  elif filetype == 'objc':
    flags += ['-ObjC']
  else:
    flags = []

  return {
    'flags':    flags,
    'do_cache': True
  }
