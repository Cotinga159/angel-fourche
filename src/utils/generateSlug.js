// src/utils/generateSlug.js
"use strict";
export const generateSlug = (title) => {
  const slugifyTitle = title
    .toLowerCase()
    .trim()
    .replace(/[^\w\s-]/g, "")
    .replace(/[\s_-]+/g, "-")
    .replace(/^-+ | -+$/g, "");

  return slugifyTitle;
};
