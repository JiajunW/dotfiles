def FlagsForFile(filename, **kwargs):

  flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
  ]

  data = kwargs['client_data']
  filetype = data['&filetype']

  if filetype == 'c':
    flags += ['-x', 'c']
  elif filetype == 'cpp':
    flags += ['-x', 'c++']
    flags += ['-std=c++11']
  elif filetype == 'objc':
    flags += ['-ObjC']
  else:
    flags = []

  return {
    'flags':    flags,
    'do_cache': True
  }
