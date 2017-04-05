var path = require('path');

module.exports = {
  getPoFilePath: function(poFile) {
  	return path.join(__dirname, 'po-files', poFile)
  },

  getEmailTemplatePath: function (emailTemplateCode) {
  	return path.join(__dirname, 'email-templates', emailTemplateCode);
  },

  getFilePath: function (path) {
    return path.join(__dirname, path);
  }
};
