application = FactoryGirl.build :application,
                                name: 'Application UI',
                                uid: 'ab93e0c48937a8a11005ee0540f7b93c54187c2558d909aba7f4d125093ab1bc',
                                secret: '82058163677be19f97f55c5d2cea8f5ecc37f3a69ab2027dab67f0c04b5ad09c'
if application.valid?
  application.save!
  print '.'
else
  print 'F'
end