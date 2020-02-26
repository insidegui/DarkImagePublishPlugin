# DarkImagePublishPlugin 😎

A plugin for [Publish](https://github.com/JohnSundell/Publish) that let's you have two variants for images on your site: one for light mode, and one for light mode. This is currently used in [rambo.codes](https://rambo.codes).

Just use the regular markdown syntax for images and the plugin takes care of the rest, so that the following markdown:

```markdown
![some image](/assets/img/2/1.png)
```

Becomes this in HTML:

```html
<figure class="dark">
    <img src="/assets/img/2/1-dark.png" alt="some image">
</figure>
<figure class="light">
    <img src="/assets/img/2/1.png" alt="some image">
</figure>
```

## Installing the plugin

To install the plugin, add it to your site's publishing steps:

```swift
try mysite().publish(using: [
    .installPlugin(.darkImage()),
    // ...
])
```

You can customize the suffix that's used for the dark variant by passing the `suffix` parameter:

```swift
try mysite().publish(using: [
    .installPlugin(.darkImage(suffix: "bestmode")),
    // ...
])
```

## Switching between images based on system theme

In order to make the images switch from light to dark and vice-versa, you can use this piece of CSS:

```css
/* Hide dark variant in light mode */
figure.dark {
  display:none;
}

/* Hide light variant and show dark variant in dark mode */
@media (prefers-color-scheme: dark) {
    figure.light {
      display:none;
    }
  
    figure.dark {
      display:inherit;
    }
}
```
