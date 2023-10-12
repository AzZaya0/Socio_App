import 'package:get/get.dart';
import 'package:intern_app/apis/postsApi.dart';
import 'package:intern_app/models/postModel.dart';
import 'package:intern_app/views/home/commentPage.dart';

class PostController extends GetxController {
  var isloading = true.obs;
  RxList<PostModel> postData = <PostModel>[].obs;
  RxList<PostModel> SinglePostData = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    isloading.value = true;
    var data = await PostsApi().getPosts();
    if (data != null) {
      postData.addAll(data);
    }
    isloading.value = false;
  }

  void ViewSinglePost(int userId) async {
    SinglePostData.clear();
    isloading.value = true;
    SinglePostData.clear(); // Clear the list before adding new data
    var data = await PostsApi().viewSinglePostData(userId);

    SinglePostData.addAll(data);

    isloading.value = false;
  }

  static void navigateToCommentPage(postId, postTitle, postBody, userId) {
    Get.to(() => CommentPage(
          postId: postId,
          postTitle: postTitle,
          postBody: postBody,
          userId: userId,
        ));
  }
}
