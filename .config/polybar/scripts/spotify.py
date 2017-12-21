#!/usr/bin/env python2
from pydbus import SessionBus
from gi.repository import GLib
import sys

TITLE_DICT_KEY = 'xesam:title'
ARTIST_DICT_KEY = 'xesam:artist'

session_bus = SessionBus()

spotify_session = session_bus.get('org.mpris.MediaPlayer2.spotify', '/org/mpris/MediaPlayer2')

meta_data = spotify_session.Metadata

def on_change(iface, changed_data, args):

    global meta_data
    meta_data = changed_data['Metadata']

    display_song()


def display_song():
    global meta_data
    sys.stdout.write('{} - {}\n'.format(meta_data[TITLE_DICT_KEY], meta_data[ARTIST_DICT_KEY]))
    sys.stdout.flush()


display_song()

spotify_session.onPropertiesChanged = on_change


try:
    GLib.MainLoop().run()
except KeyboardInterrupt:
    pass
