// Save as ~/.finicky.js

module.exports = {
  defaultBrowser: "Safari",
  handlers: [
    {
      match: /^https?:\/\/meet\.google\.com\/.*$/,
      browser: {
        name: "Google Chrome"
      }
    },
    {
      match: /^https?:\/\/app\.datadoghq\.eu\/.*$/,
      browser: {
        name: "Google Chrome",
      }
    },
    {
      match: /^https?:\/\/sentry\.io\/.*$/,
      browser: {
        name:  "Google Chrome",
      }
    },
    {
      match: /^https?:\/\/device\.sso\.eu\-central\-1\.amazonaws\.com\/.*$/,
      browser: {
        name:  "Google Chrome",
      }
    },
    {
      match: /^https?:\/\/dashboard\.stripe\.com\/.*$/,
      browser: {
        name:  "Google Chrome",
      }
    },
    {
      match: /^https?:\/\/factorial\.sentry\.io\/.*$/,
      browser: {
        name:  "Google Chrome",
      }
    },
    {
      match: "https://www.figma.com/file/*",
      browser: "Figma",
    },
    {
      match: /zoom\.us\/join/,
      browser: "us.zoom.xos"
    }
  ],
  rewrite: [
    {
      match: () => true, // Execute rewrite on all incoming urls to make this example easier to understand
      url: ({url}) => {
          const removeKeysStartingWith = ["utm_", "uta_"]; // Remove all query parameters beginning with these strings
          const removeKeys = ["fbclid", "gclid"]; // Remove all query parameters matching these keys

          const search = url.search
              .split("&")
              .map((parameter) => parameter.split("="))
              .filter(([key]) => !removeKeysStartingWith.some((startingWith) => key.startsWith(startingWith)))
              .filter(([key]) => !removeKeys.some((removeKey) => key === removeKey));

          return {
              ...url,
              search: search.map((parameter) => parameter.join("=")).join("&"),
          };
      },
    },
    {
      match: ({ url }) => url.host.includes("zoom.us") && url.pathname.includes("/j/"),
      url: ({ url }) => {
        try {
          var pass = '&pwd=' + url.search.match(/pwd=(\w*)/)[1];
        } catch {
          var pass = ""
        }
        var conf = 'confno=' + url.pathname.match(/\/j\/(\d+)/)[1];

        return {
          search: conf + pass,
          pathname: '/join',
          protocol: "zoommtg"
        };
      },
    }
  ]
}