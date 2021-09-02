# XnO
A minimalistic board game

## Roadmap:
- Draw Board geometrics to the screen using primitives
- Add Tile objects to the Board stores inside of Board.map
- Add Cursor tracking and the EventLoop with `:mouse_click_event`, `:key_press_event`
  (`:mouse_hover', ':focus')
  One ovent ocuring should mementarly cancel the one buffored, so the state of each event type will be denamic
- Tile change on event
- Game round logic and checking the nearby rows following `:mouse_click_event` location
