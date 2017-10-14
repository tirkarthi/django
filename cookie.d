module cookie;

import pyd.pyd;
import std.stdio;
import std.string;
import std.array;

auto parse_cookie(string cookie) {
  string[string] cookiedict;
  string key, val;
  foreach(chunk; cookie.split(";")) {
    if(chunk.indexOf("=") >= 0) {
      auto vals = chunk.split("=");
      key = vals[0];
      val = vals[1];
    } else {
      key = "";
      val = chunk;
    }
    key = key.strip();
    val = val.strip();
    if(key.length || val.length) {
      cookiedict[key] = val;
    }
  }
  return cookiedict;
}

void cookie() {
}

extern(C) void PydMain() {
  def!(parse_cookie, PyName!"parse_cookie")();
  module_init();
  def!(cookie)();
  module_init();
}
