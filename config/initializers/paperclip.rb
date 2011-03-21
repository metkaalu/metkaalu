Paperclip::Attachment.interpolations[:store] = proc do |attachment, style|
  attachment.instance.product.store_id # or whatever you've named your User's login/username/etc. attribute
end
