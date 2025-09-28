function read-confirm
  while true
    read -l -P 'Confirm? [y/N] ' confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end
