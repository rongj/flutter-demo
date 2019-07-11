/*
 * @Author: Rongj
 * @Date: 2019-07-11 15:15:51
 * @LastEditTime: 2019-07-11 16:59:53
 */

/* states */
class MainState{
  int count;
  MainState({ this.count: 0 });
}

class AuthState{
  String user;
  AuthState({ this.user: 'Tony'});
}

/* actions */
enum Action {
  increment
}

/* combine */
class AppState{
  MainState main;
  AuthState auth;

  AppState({ this.main, this.auth });
}

/* reducers */
AppState reducers(AppState state, dynamic action) {
  if (action == Action.increment) {
    state.main.count += 1;
  }
  return state;
}

/* initState */
// AppState initState = AppState(
//   main: MainState(),
//   auth: AuthState()
// );

