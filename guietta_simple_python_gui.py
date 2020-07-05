from guietta import _, Gui, Quit

gui = Gui(
  ["1littlecoder Video",_,_,_,"Please subscribe"],
  [  'Enter numbers:', '__a__'  , '+' , '__b__',  ['Calculate'] ],
  [  'Result:  -->'  , 'summed_up_value' ,  _  ,    _   ,       _        ],
  [  _               ,    _     ,  _  ,    _   ,      Quit      ]
)
with gui.Calculate:
  
    gui.summed_up_value = float(gui.a) + float(gui.b)
    
gui.run()


