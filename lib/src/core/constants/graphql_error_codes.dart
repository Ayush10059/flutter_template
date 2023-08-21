abstract class GraphqlErrorCodes {
  static const String unAuthenticated = 'UNAUTHENTICATED';
  static const String parse = 'GRAPHQL_PARSE_FAILED';
  static const String validation = 'GRAPHQL_VALIDATION_FAILED';
  static const String badRequest = 'BAD_USER_INPUT';
  static const String forbidden = 'FORBIDDEN';
  static const String queryNotFound = 'PERSISTED_QUERY_NOT_FOUND';
  static const String queryNotSupported = 'PERSISTED_QUERY_NOT_SUPPORTED';
  static const String server = 'INTERNAL_SERVER_ERROR';
}

///
/// GRAPHQL Error Response Should be in following format
///{
//   "errors": [
//     {
//       "message": "Invalid argument value",
//       "locations": [
//         {
//           "line": 2,
//           "column": 3
//         }
//       ],
//       "path": [
//         "userWithID"
//       ],
//       "extensions": {
//         "argumentName": "id",
//         "code": "BAD_USER_INPUT",
//         "exception": {
//           "stacktrace": [
//             "UserInputError: Invalid argument value",
//             "    at userWithID (/my-project/index.js:25:13)",
//             "    ...more lines...",
//           ]
//         }
//       }
//     }
//   ]
// }
