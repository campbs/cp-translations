var path = require('path');

module.exports = {
  getPoFilePath: function(poFile, locale) {
  	return path.join(__dirname, 'po-files', locale, poFile)
  },

  getEmailTemplatePath: function (emailTemplateCode) {
  	return path.join(__dirname, 'email-templates', emailTemplateCode || '');
  },

  getFilePath: function (filePath) {
    return path.join(__dirname, filePath);
  }
};
