import kivy
kivy.require('1.8.0')  # replace with your current kivy version !

from kivy.app import App

from kivy.uix.label import Label
from kivy.uix.scatter import Scatter
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.textinput import TextInput
from kivy.uix.boxlayout import BoxLayout


class MyApp(App):

    def build(self):
        b = BoxLayout(orientation='vertical')
        t1 = TextInput(font_size=100,
                       size_hint_y=None,
                       height=120,
                       text='default')
        t2 = TextInput(font_size=100,
                       size_hint_y=None,
                       height=120,
                       text='default')
        f = FloatLayout()
        s = Scatter()
        l = Label(text="default",
                  font_size=100)

        t1.bind(text=l.setter('text'))
        t2.bind(text=l.setter('text'))

        f.add_widget(s)
        s.add_widget(l)
        b.add_widget(t1)
        b.add_widget(t2)
        b.add_widget(f)
        return b

if __name__ == '__main__':
    k = MyApp()
    k.run()
