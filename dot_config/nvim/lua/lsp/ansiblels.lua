return {
  ansible = {
    ansible = {
      path = "ansible",
    },
    executionEnvironment = {
      enabled = false,
    },
    python = {
      interpreterPath = "python3",
    },
    validation = {
      enabled = true,
      lint = {
        enabled = true,
        path = "ansible-lint",
      },
    },
  },
}
