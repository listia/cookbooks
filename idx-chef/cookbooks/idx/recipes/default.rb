#
# Cookbook Name:: idx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "glusterfs-client" do
  action :install
end

include_recipe "user"

user_account "listia" do
  create_group true
  ssh_keys [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEGRF4DvfCIYIPz/cl0Vtlo5eeo5BOHLvBrWzp0SLDW+RTe/o/zgGv09NV4WVDRLcOpNJUeyIAAcKow3qeecqEMUnlXc7H/v9dK5UgMGKGXJJVgkW+L20jsvwLOL+HOjCaj21q79y7xEeS7l4QFOVI0QSrnHCmAZbzDIogFRZk/QInX24vuvIdeU748I8k75iHQVPHTTThwRWmAaN7TaPLnaASjGmDeVN4le8BVo3pD/eLnMTx31ToDmHfWFFqgRSTz+RqUM4hltr1wdeYdUlsUeiP5emZScwPJVDq4B2PSpoSkvUpXxEGSmZq1QyrepNx3lhgm5FvUPuM5tSfH/sFG4Y6ghQDDS0Y67fsdBSnog0qu2qlGUF1eFU371ibkKNkrzFkv36FqM6DSLVpj7tI+io9u3eGgiIsPY1usDMk1OAGomA9hQ9ThGJYB8nu7oPmITShEzEbw4yqyxcBDcDZbId2BckbfREfWOizIu69rMEA3+QsDb5dTAtIbgO4ik+o21IglFxIQyArFsHV4LoCmDC0MzTGZkKWLcKnwnqo5B7k/u4BPPYGns1lQL56cmP8i3A3Wixt/7uBZOqfjNhgNG3NzYdBARyjqnk+Zf+8qlvE1HrlgUdcg7isjGdtWr6kvQPPY9W8GS9ytpJ632RlZ1Nz5z6FkKsV8dV3WlUIJQ== dev-root",
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNz4PXzZ7zjQAdA+eoHWGsiEuDNI/sznJGdStY/+/BvKkbOQW6Y8Tm+/GAOTIz1x+Ibeq+XXmv7uudWYV48kElN67QBt9BvT2wvazzPWB31uVcHGHXCeAnSCjlBOmvgFCdxLWvN+EIyajMjFwDTq7eh6kJht7uYRtBDgizvbh4EOGvYSjf+5N+ltcYePLdh/KSzW/qFH61AJE/gu0Ioq7cs+MmzOENi0iZIG2JMUXxcmZAQ3uyiLbkmIS+5C/ie1Ux7ottcfWLZ/Yfd9owOhkarwcbfqI5zMihqiv72OG7fckcphucA3cttj19aCDIB+11pJzxlG2P0aTs9RzmbUj4Yf/lGKO6x3ZAbNQFglaJ2ixlZIDUmn/bt+kPrxNU6E/3RNj6qz++7O6zjn+g4gtszE6OdSWQ+xjZYFafrFWtQZ4angIolb3lpe5SIams4Xclae/px9iyo/2r25u3AMx6fNSXViVEjjlWcmGDkwUMcLMugH0t5gNIUG7ggtK1fCSCvtyqrep0pObHB5Z2EGityEbKdVt+WvBcMM3hvvs9R5rHHUFeOBtIXkwDHqueGngGqFK4qYVb795OizLkTZZmagQzbx22+3lYv9Br88CfV3IQbx203fS+c5zUFiPfw0B0G8AAOvCbfRPo3HdfWFd2uhle6QALEKsxAuBhrOUpEQ== webistrano@dev-res1"
  ]
  action :create
end


# bash "mount and link shared folder" do
#   code "mount.glusterfs sec-res1.listia.com:/listia /mnt/listia"
#   code "ln -s /mnt/listia /home/listia/shared"
# end
