// Context class
class Player {
  late State _state;

  Player() {
    _state = StandbyState();
  }

  void setState(State newState) => _state = newState;

  void pressPlay() => _state.pressPlay(this);
}

// State interface
abstract interface class State {
  void pressPlay(Player player);
}

// Concrete state classes
class StandbyState implements State {
  @override
  void pressPlay(Player player) {
    print("Starting playback.");
    player.setState(PlayingState());
  }
}

class PlayingState implements State {
  @override
  void pressPlay(Player player) {
    print("Pausing playback.");
    player.setState(PausedState());
  }
}

class PausedState implements State {
  @override
  void pressPlay(Player player) {
    print("Resuming playback.");
    player.setState(PlayingState());
  }
}

// Usage example
void main() {
  final player = Player();

  // Initial state is StandbyState
  player.pressPlay(); // Output: Starting playback.

  // State changes to PlayingState
  player.pressPlay(); // Output: Pausing playback.

  // State changes to PausedState
  player.pressPlay(); // Output: Resuming playback.

  // State changes back to PlayingState
  player.pressPlay(); // Output: Pausing playback.
}
