return {
  files = {
    managed = {
      {
        path = "/etc/basalt/motd",
        content = "Basalt managed file\n",
        mode = "0644",
      },
    },
  },
}
