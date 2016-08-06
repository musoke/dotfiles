// disable some commands in Jupyter notebooks
vimfx.addKeyOverrides(
  [ location => location.hostname === 'localhost' && 
                location.port === '8888' && 
                location.pathname.startsWith('/notebooks/'),
    ['j', 'k', 
     'r', 'm', 'y',
     'f',
     'a', 'b', 'x', 'c', 'v', 'z',
     's', 'i', 'h',
     'l', 'o']
  ]
)

// disable some commands in gmail
vimfx.addKeyOverrides(
  [ location => location.hostname === 'mail.google.com',
    ['j', 'k', 'r', 'a', '/']
  ]
)

// Prevent autofocus
vimfx.set('prevent_autofocus', true)
