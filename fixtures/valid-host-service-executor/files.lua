return {
  files = {
    managed = {
      {
        path = "/etc/systemd/system/basalt-smoke.service",
        content = "[Unit]\nDescription=Basalt smoke test unit\n\n[Service]\nType=oneshot\nExecStart=/usr/bin/true\nRemainAfterExit=yes\n\n[Install]\nWantedBy=multi-user.target\n",
        mode = "0644",
      },
    },
  },
}
