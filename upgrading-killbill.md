# Upgrading version of KillBill used

Our build script currently uses fixed tags for building KB from scratch from its various repos. The tags used need to all work together, so that the build will pick up the changes and not pull the dependencies from maven.

To find the tags needed:

1. Go to the [base killbill repo](github.com/killbill/killbill). Checkout the tag of the release (or git commit) you want to use. Open `pom.xml`. Use `//project/version` as `KBVER`. If you checked out a tag, then `KBTAG` will be correct - if you checked out a commit, then you need to update `KBTAG` with the commit's hash. Use `//project/parent/version`.
2. Go to the [killbill oss parent](github.com/killbill/killbill-oss-parent). Check out the tag that corresponds to the version gathered above, and place that tag name in `OSSPARENTTAG`. Open `pom.xml`, and find both `//project/properties/killbill-commons.version` and `//project/properties/killbill-platform.version`.
3. Go to the [killbill-commons](github.com/killbill/killbill-commons) repo and find the tag corresponding to `killbill-commons.version`. Replace `COMMONSTAG` with that tag.
4. Go to the [killbill-platform](github.com/killbill/killbill-platform) repo and find the tag corresponding to `killbill-platform.version`. Replace `PLATFORMTAG` with that tag.

You should now try running the build script. If the numbers all line up, you should get a new deployed .war file with no errors.
