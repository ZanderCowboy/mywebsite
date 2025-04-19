'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"index.html": "dc63e3a47aa0cb1edc3c9d39d0057398",
"/": "dc63e3a47aa0cb1edc3c9d39d0057398",
"assets/NOTICES": "022cf85284cee916d09534f09964bba6",
"assets/assets/images/personal_page.jpg": "334817453b42f9f9400a8064d70d483d",
"assets/assets/images/favicon_old.png": "defa73e5d7ca15fa4f0d5c5b8ed38510",
"assets/assets/images/home_page.jpg": "cff0e25913c8828595536d816a5b453b",
"assets/assets/images/image1.svg": "f9394a9ed7e7e356afe35081d14eee5b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "46c04290ce52ed39ee39eb3489966f38",
"assets/images/cancel/icons8-cancel-192.svg": "8ce8a725c66d69b8f1f2e2a6c9f50337",
"assets/images/cancel/icons8-cancel-24.svg": "58dd5675884ce66aea00b34c4e0289cd",
"assets/images/cancel/icons8-cancel-96.svg": "378b46a86aaed3498e2cdc86dcc5ffd7",
"assets/images/cancel/icons8-cancel-48.svg": "2618d4c63747fb6f1c2ee9a6e5bea7f5",
"assets/images/cancel/icons8-cancel-384.svg": "1277b83d7c75c1bdd739567a9b6e898d",
"assets/images/github/icons8-github-48.svg": "a5c6419a08733050b07c06868452e077",
"assets/images/github/icons8-github-96.svg": "a3f62762915129f3c91029f908b86447",
"assets/images/github/icons8-github-144.svg": "6946117da4851192928f612766e5b95e",
"assets/images/github/icons8-github-384.svg": "d9d3206f1c57430c5bbd5eb19af6b60c",
"assets/images/mountain.webp": "291c492da13caf9b3cb5cee2d20693f5",
"assets/images/profile2.webp": "1fbd067bb9e87bf29b9f0c088db17b9f",
"assets/images/instagram/icons8-instagram-48.svg": "a213be05d2559f74a4bf4424160bc09b",
"assets/images/instagram/icons8-instagram-24.svg": "2038ffdc79dfe1e7f885a2707947f872",
"assets/images/instagram/icons8-instagram-384.svg": "e9e5b0c81f4b89cfa5deb8c18ee182a0",
"assets/images/instagram/icons8-instagram-192.svg": "efca139fd3edc0387ebd83fb1d9c84fe",
"assets/images/instagram/icons8-instagram-96.svg": "592b7c73be4915746eccbcb5d1f0f6c3",
"assets/images/profile2.png": "51b8b113ad07b79e6beb0c062616ca29",
"assets/images/youtube/icons8-youtube-384.svg": "15a15375bb4cc605f5b2c9b100ab44cc",
"assets/images/youtube/icons8-youtube-480.svg": "7ecf58b8dc22dfc42832d63ed7240eae",
"assets/images/youtube/icons8-youtube-240.svg": "fdd7c183ebd3491ab0c040e667f8fe61",
"assets/images/youtube/icons8-youtube-120.svg": "a523151111e66f9f1c768828b52560b7",
"assets/images/youtube/icons8-youtube-60.svg": "941da4cc2139b55cf33db5944abffc17",
"assets/images/youtube/icons8-youtube-90.svg": "5388c652e6c14dc7fd531f3c78ad350f",
"assets/images/youtube/icons8-youtube-30.svg": "4190c55bfb8e96bbadc6e1ed8e6ccad3",
"assets/images/twitter/icons8-twitter-96.svg": "571e3fb598c52c8bb232acc7c916c4ed",
"assets/images/twitter/icons8-twitter-48.svg": "85a34ced3f5e301661c8881f1c7d7b6d",
"assets/images/twitter/icons8-twitter-384.svg": "fdd984b4e974c052e660339c553552d1",
"assets/images/twitter/icons8-twitter-24.svg": "691f410cb25d18c2b9f00609a3835642",
"assets/images/twitter/icons8-twitter-192.svg": "473358422b22cc6e25121de853ccaa20",
"assets/images/icons8-instagram-26.png": "af877964443c29516489ada57f0b6735",
"assets/images/image1.jpeg": "631cc8fb2f3270e17051f8940b8074b4",
"assets/images/discord/icons8-discord-new-256.svg": "e783169b9a7e1b9f380a27afae6a9cbd",
"assets/images/discord/icons8-discord-new-384.svg": "9e4f42189cd816754de6a3c338c8e47f",
"assets/images/discord/discord-mark-white.svg": "ba626c72c8740daa5f23c93e5f63a8bd",
"assets/images/discord/icons8-discord-new-128.svg": "944f2a11957b51dba4bc9fb609f0b633",
"assets/images/discord/icons8-discord-new-512.svg": "000d0a6cd409ae153c19935d624bee5c",
"assets/images/discord/icons8-discord-new-64.svg": "76703255ffb965e044fb6bb7dfd1207a",
"assets/images/mountain.jpg": "8d0070e1eff36a60810b24823dfc487a",
"assets/images/profile.png": "45b6edad50234cba67d08eac15abd7c3",
"assets/images/internet/rocket_launch_white_48dp.svg": "5786a18c0f8c8c331e5d05b22061263c",
"assets/images/linkedin/icons8-linkedin-120.svg": "5dff2b1ea086a72fc485b4313692d2ee",
"assets/images/linkedin/icons8-linkedin-480.svg": "36ce2a9f9e81e966bc31c2c6de2ac0c8",
"assets/images/linkedin/icons8-linkedin-60.svg": "e3255eb251c91757cf7d13acbe8f1ea9",
"assets/images/linkedin/icons8-linkedin-90.svg": "8d443d282d3657ad1088c975d3daf07d",
"assets/images/linkedin/icons8-linkedin-240.svg": "d7c3a3997d2618acf09670381eeb6261",
"assets/images/linkedin/icons8-linkedin-30.svg": "1687a389f41cbca118e981c030c5ff19",
"assets/images/linkedin/icons8-linkedin-384.svg": "8bf99bce690692b59805fe0b1bb2fc37",
"assets/images/image1.svg": "a79cd2ecdd1b001a6a93d8196d3ae89d",
"assets/fonts/anton/Anton-Regular.ttf": "055c4df4e2f8c7a4d4675cdd8fa68da0",
"assets/fonts/PlayfairDisplay-Regular.ttf": "a96ecd13655587d30a21265c547cd8aa",
"assets/fonts/MaterialIcons-Regular.otf": "7754781524382095e4b3eb9d446d08f8",
"assets/fonts/poiret_one/PoiretOne-Regular.ttf": "8d15f9c0d468e1de889e81fae1087b61",
"assets/FontManifest.json": "66c1b07c08816037ffa7f281865bcbf2",
"assets/AssetManifest.bin.json": "4275f631ffb1f37bdd1482a4ac0d890d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.json": "18a4ec424c6d7cb9ca7ced7af5f824f4",
"version.json": "fbca15f593fb7081043a86cf0f4199b2",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"main.dart.js": "5f2e4956d1549df3f97541941028ac67",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "c7fe69951ec2a6e88148cfeb75ad394b",
"favicon.png": "3a38cda9e7dbd3bb8a4845ac69785053",
"flutter_bootstrap.js": "d898053eac0e463215eeb2fba65b7c7b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
