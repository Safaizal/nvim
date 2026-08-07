local colors = {
  black        = '#000000',
  black1       = '#333333',
  black2       = '#555555',
  black3       = '#777777',
  black4       = '#999999',
  white        = '#ffffff',
  white1       = '#aaaaaa',
  red          = '#ff0000',
  green        = '#00aa00',
  blue         = '#0d0dbf',
  yellow       = '#999900',
  amanojaku    = '#00ff11',
}
return {
  normal = {
    a = {bg = colors.black3, fg = colors.black, gui = 'bold'},
    b = {bg = colors.black2, fg = colors.white},
    c = {bg = colors.black, fg = colors.white}
  },
  insert = {
    a = {bg = colors.black, fg = colors.amanojaku, gui = 'bold'},
    b = {bg = colors.black2, fg = colors.white},
    c = {bg = colors.black4, fg = colors.black, gui = 'bold'}
  },
  visual = {
    a = {bg = colors.black, fg = colors.amanojaku, gui = 'bold'},
    b = {bg = colors.black1, fg = colors.white},
    c = {bg = colors.black2, fg = colors.white}
  },
  replace = {
    a = {bg = colors.black, fg = colors.red, gui = 'bold'},
    b = {bg = colors.black2, fg = colors.white},
    c = {bg = colors.black, fg = colors.white}
  },
  command = {
    a = {bg = colors.white1, fg = colors.black, gui = 'bold'},
    b = {bg = colors.black2, fg = colors.white},
    c = {bg = colors.black, fg = colors.amanojaku}
  },
  inactive = {
    a = {bg = colors.black1, fg = colors.black3, gui = 'bold'},
    b = {bg = colors.black1, fg = colors.black3},
    c = {bg = colors.black1, fg = colors.black3}
  }
}
