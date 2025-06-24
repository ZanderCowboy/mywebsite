'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"manifest.json": "c7fe69951ec2a6e88148cfeb75ad394b",
"main.dart.js": "10cd488313532cbacfd6674c50f2ff42",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"index.html": "9288d7ac8af7676b360c4028d381daf3",
"/": "9288d7ac8af7676b360c4028d381daf3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.bin.json": "cb830cec6c2cd4bc23a2bec14601c69a",
"assets/AssetManifest.bin": "a26692124fb738068b479b1d5dfec01c",
"assets/NOTICES": "5626da30fa5374639abfb4b51ec026f3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/fonts/anton/Anton-Regular.ttf": "055c4df4e2f8c7a4d4675cdd8fa68da0",
"assets/assets/fonts/poiret_one/PoiretOne-Regular.ttf": "8d15f9c0d468e1de889e81fae1087b61",
"assets/assets/fonts/PlayfairDisplay-Regular.ttf": "a96ecd13655587d30a21265c547cd8aa",
"assets/assets/images/home_page_background.jpg": "cff0e25913c8828595536d816a5b453b",
"assets/assets/images/profile/profile2.webp": "1fbd067bb9e87bf29b9f0c088db17b9f",
"assets/assets/images/profile/profile2.png": "51b8b113ad07b79e6beb0c062616ca29",
"assets/assets/images/profile/profile.png": "45b6edad50234cba67d08eac15abd7c3",
"assets/assets/images/skills/git.png": "f08359f6065582f2f21e58a03fd26ff5",
"assets/assets/images/skills/docker.png": "b89c59716669c8c8528f53f8c4ab6662",
"assets/assets/images/skills/vscode_white.png": "b7c4dc44842f6fa2ab4e7f5ed3e2b43a",
"assets/assets/images/skills/mathematics.png": "cc4aacf0ceb69656ee91b44d00e999f2",
"assets/assets/images/skills/flutter.png": "681112726dc8a928280d5bb58a25ddbc",
"assets/assets/images/skills/python.png": "7fcc0240033abc1ccf89e3459638cbbc",
"assets/assets/images/skills/java.png": "84343eecb0fee6f788f9d972d7e549de",
"assets/assets/images/skills/oop.png": "41b5375975c4a0c16f360f842d21a66d",
"assets/assets/images/skills/vscode.png": "3919e5b2f737f142a45921320e666382",
"assets/assets/images/skills/dart.png": "ec03108d61dfe3fd70d9ccb2cb32dfc8",
"assets/assets/images/skills/github_actions.png": "1f0170ab0f4c154361b47f0422b94092",
"assets/assets/images/skills/c_plus_plus.png": "8269edd026241cf8d7fba9cdbd622f33",
"assets/assets/images/placeholder.png": "916d3d4ac2cc9f3b14738ad1d9d7a84a",
"assets/assets/images/home/youtube.svg": "15a15375bb4cc605f5b2c9b100ab44cc",
"assets/assets/images/home/github.svg": "d9d3206f1c57430c5bbd5eb19af6b60c",
"assets/assets/images/home/cancel.svg": "1277b83d7c75c1bdd739567a9b6e898d",
"assets/assets/images/home/twitter.svg": "fdd984b4e974c052e660339c553552d1",
"assets/assets/images/home/linkedin.svg": "8bf99bce690692b59805fe0b1bb2fc37",
"assets/assets/images/home/rocket_launch.svg": "5786a18c0f8c8c331e5d05b22061263c",
"assets/assets/images/home/instagram.svg": "e9e5b0c81f4b89cfa5deb8c18ee182a0",
"assets/assets/images/home/discord.svg": "9e4f42189cd816754de6a3c338c8e47f",
"assets/assets/images/home/mountain.jpg": "8d0070e1eff36a60810b24823dfc487a",
"assets/assets/images/home/discord-mark-white.svg": "ba626c72c8740daa5f23c93e5f63a8bd",
"assets/assets/images/home/mountain.webp": "291c492da13caf9b3cb5cee2d20693f5",
"assets/assets/images/favicon_old.png": "defa73e5d7ca15fa4f0d5c5b8ed38510",
"assets/assets/images/projects/placeholder.png": "916d3d4ac2cc9f3b14738ad1d9d7a84a",
"assets/assets/images/personal_page_background.jpg": "334817453b42f9f9400a8064d70d483d",
"assets/AssetManifest.json": "1733ed7a52c27e3af5d2eac354c86365",
"assets/fonts/MaterialIcons-Regular.otf": "05d3af6110752f534434acd7bc7ee0da",
"assets/FontManifest.json": "3d4406ba829f160ae736c23a81ec80c2",
"favicon.png": "3a38cda9e7dbd3bb8a4845ac69785053",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"flutter_bootstrap.js": "c8e051c4d13a2a3bd7f0b8b70d86e060",
"version.json": "b9fc57dd56aaea922174e05118bdf255"};
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
