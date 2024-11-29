const createErrorResponse = (statusCode, message, details) => {
    return {
      status: 'error',
      error: {
        code: statusCode,
        message: message,
        details: details,
      },
      data: null,
    };
  };
  
  module.exports = createErrorResponse;