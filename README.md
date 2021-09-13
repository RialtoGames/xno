# XnO
A minimalistic board game

## Roadmap:
- [DONE] Draw basic Board geometrics to the screen using primitives
- [DONE] Add Tile object abstraction to represent tiles inside of Board.map
- Configurable states with basic atom value and Ruby objects parsing
- Add Cursor tracking and the EventLoop with `:mouse_click`, `:key_press`, `:mouse_hover`, `:mouse_hold`, `:focus`
  One ovent ocuring should mementarly cancel the one buffored, so the state of each event type will be denamic
- Tile change on event
- Game round logic and checking the nearby rows following `:mouse_click_event` location
