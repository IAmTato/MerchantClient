angular.module('eMerchant')

.constant("ENV", {
  name: "eMerchant",
  accessToken: '',
  debug: false,
  appleId: 'xxxx',
  version:'0.0.1'
}).constant("DWR",{
        webRootPath : "http://localhost:8080/icbc/mo/emerchant"
    })
.constant('AUTH_EVENTS', {
  notAuthenticated: 'auth-not-authenticated',
  notAuthorized: 'auth-not-authorized'
})
.constant('USER_ROLES', {
  admin: 'admin_role',
  public: 'public_role'
});
