enum LockState { error, close, open }

String fromLockStateToString(LockState state) {
  switch (state) {
    case LockState.close:
      return 'Fechada';
    case LockState.open:
      return 'Aberta';
    case LockState.error:
      return 'Sem Fechadura';
    default:
      return 'Sem Fechadura';
  }
}
