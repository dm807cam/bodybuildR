library('hexSticker')
library('showtext')
## Loading Google fonts (http://www.google.com/fonts)
font_add_google('Abel')
## Automatically use showtext to render text for future devices
showtext_auto()

imgurl <- 'bodybuilder.png'

sticker(imgurl,
        package='bodybuildR', 
        p_family = 'Abel',
        p_size=8.5,
        p_y = 1.37,
        h_color = "grey70",
        h_fill = "black",
        s_x=1, 
        s_y=0.7, 
        s_width=1, 
        s_height=1,
        url = "https://github.com/dm807cam/bodybuildR",
        u_size = 1,
        u_color = "white",
        filename="logo.png")
