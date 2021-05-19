

int silnia(int x) {
  if(x == 0) {
    return 1;
  }
  return x * silnia(x - 1);
}

int main() {
  int n = 10, i = 0;
  while(i <= n) {
    print(i);
    print(silnia(i));
    print("\n");
    i++;
  }
  print(i);
  i = 69;
  print(i);
  return 0;
}
