/**
 * Injecte un token CSRF dans req pour les vues SSR
 *
 * @see https://www.npmjs.com/package/csrf-csrf
 */
export function injectCsrfToken(generateToken) {
  return (req, res, next) => {
    if (typeof generateToken !== "function") {
      return next(new Error("CSRF generateToken is not a function"));
    }

    req.csrfToken = () => generateToken(req, res);
    next();
  };
}
