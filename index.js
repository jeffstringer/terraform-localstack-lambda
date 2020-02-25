exports.handler = async (event) => {
  return event.Details.Parameters.CustomerCallbackNumber;
}
